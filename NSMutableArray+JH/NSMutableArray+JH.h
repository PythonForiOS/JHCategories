/*
 *  NSMutableArray+JH.h
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 12/9/11
 *
 *  Copyright (c) 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */

@interface NSMutableArray (JH)

- (void)reverse;
- (void)removeFirstObject;
- (void)replaceFirstObjectWithObject:(id)object;
- (void)replaceLastObjectWithObject:(id)object;
- (NSArray *)arrayByReplacingLastObjectWithObject:(id)object;


@end
