/*
 *  NSThread+JH.m
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 11/2/12
 *
 *  Copyright 2012 Jonathan Hosmer
 *  http://hozbox.com
 */

#import "NSThread+JH.h"

@implementation NSThread (FunctionExtension)

+ (void)startBackgroundThreadUsingFunction:(id)object {
    @autoreleasepool {
        void (*startThreadFunction)(void*) = (void(*)(void*))[[object objectForKey:@"function"] pointerValue];
        if (startThreadFunction) {
            void *startThreadData = (void*)[[object objectForKey:@"data"] pointerValue];
            startThreadFunction(startThreadData);
        }
    }
}

+ (void)detachNewThreadByCallingFunction:(void(*)(void*))function data:(void*)data {
    [[[[NSThread alloc] initWithFunction:function
                                    data:data] autorelease] start];
}

- (id)initWithFunction:(void(*)(void*))function data:(void*)data {
    id t;
    SEL s;
    NSDictionary *d;
    
    t = [NSThread class];
    s = @selector(startBackgroundThreadUsingFunction:);
    d = @{
        @"function" : [NSValue valueWithPointer:function],
        @"data"     : [NSValue valueWithPointer:data]
    };
    return [self initWithTarget:t selector:s object:d];
}

@end
