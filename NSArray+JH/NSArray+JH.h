/*
 *  NSArray-Extended.h
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 12/8/11
 *
 *  Copyright (c) 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
@interface NSArray (JH)

- (id)firstObject;
- (NSString *)stringAtIndex:(NSUInteger)index;
- (NSDate *)dateAtIndex:(NSUInteger)index;
- (NSData *)dataAtIndex:(NSUInteger)index;
- (NSValue *)valueAtIndex:(NSUInteger)index;
- (NSArray *)reversedArray;
- (NSMutableArray *)reversedMutableArray;
- (void)printDescription;

@end
