/*
 *  NSArray-Extended.m
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 12/8/11
 *
 *  Copyright (c) 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
#import "NSArray+JH.h"
    
@implementation NSArray (JH)

- (id)firstObject {
    id object = nil;
    if (self.count) {
        object = [self objectAtIndex:0];
    } else {
        object = nil;
    }
    return object;
}

- (NSString *)stringAtIndex:(NSUInteger)index {
    return (NSString *)[self objectAtIndex:index];
}

- (NSDate *)dateAtIndex:(NSUInteger)index {
    return (NSDate *)[self objectAtIndex:index];
}

- (NSData *)dataAtIndex:(NSUInteger)index {
    return (NSData *)[self objectAtIndex:index];
}

- (NSValue *)valueAtIndex:(NSUInteger)index {
    return (NSValue *)[self objectAtIndex:index];
}

- (void)printDescription {
    DEBUGLOG(@"%@", [self description]);
}

- (NSArray *)reversedArray {
    return [[[self reversedMutableArray] copy] autorelease];
}

- (NSMutableArray *)reversedMutableArray {
    NSMutableArray *result = [NSMutableArray arrayWithCapacity:[self count]];
    for (id obj in [self reverseObjectEnumerator]) {
        [result addObject:obj];
    }
    return result;
}

@end
