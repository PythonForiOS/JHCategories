/*
 *  NSThread+JH.h
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 11/2/12
 *
 *  Copyright 2012 Jonathan Hosmer
 *  http://hozbox.com
 */

#import <Foundation/Foundation.h>

@interface NSThread (JH)

+ (void)detachNewThreadByCallingFunction:(void(*)(void*))function data:(void*)data;
- (id)initWithFunction:(void(*)(void*))function data:(void*)data;

@end
