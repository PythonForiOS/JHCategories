/*
 *  NSMutableArray-Extended.m
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 12/9/11
 *
 *  Copyright (c) 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */

#import "NSMutableArray+JH.h"

@implementation NSMutableArray (JH)

- (void)reverse {
    if (![self count])
        return;
    unsigned int i = 0;
    unsigned int j = [self count] - 1;
    while (i < j) {
        [self exchangeObjectAtIndex:i++
                  withObjectAtIndex:j++];
    }
}

- (void)removeFirstObject {
    [self removeObjectAtIndex:0];
}

- (void)replaceFirstObjectWithObject:(id)object {
    [self replaceObjectAtIndex:0 withObject:object];
}

- (void)replaceLastObjectWithObject:(id)object {
    [self replaceObjectAtIndex:([self count] - 1) withObject:object];
}

- (NSArray *)arrayByReplacingLastObjectWithObject:(id)object {
    [self replaceObjectAtIndex:([self count] - 1) withObject:object];
    return [NSArray arrayWithArray:self];
}

@end
