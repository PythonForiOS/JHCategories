/*
 *  NSRange+JH.m
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 10/18/12
 *
 *  Copyright 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */

#import "NSRange+JH.h"

BOOL NSRangeOverlapsRange(NSRange r1, NSRange r2) {
    if (r1.location < r2.location)
        return (r2.location - r1.location) <= r1.length;
    else if (r1.location > r2.location)
        return (r1.location - r2.location) <= r2.length;
    else
        return r1.length > 0 && r2.length > 0;
}

BOOL NSRangeContainsRange(NSRange r1, NSRange r2) {
    return (r1.location > r2.location ? NO : ((r1.location + r1.length) < (r2.location + r2.length) ? NO : YES));
}

NSRange NSRangeJoin(NSRange r1, NSRange r2) {
    
    NSUInteger startIndex = MIN(r1.location, r2.location);
    NSUInteger endIndex = MAX(r1.location + r1.length, r2.location + r2.length);
    return NSMakeRange(startIndex, endIndex - startIndex);
}

void NSRangePartition(NSRange r1, NSRange r2, NSRange *part1, NSRange *part2) {
    *part1 = (NSRange){NSNotFound, 0};
    *part2 = (NSRange){NSNotFound, 0};
    
    if (!NSRangeContainsRange(r1, r2))
        return;
    
    if (r1.location < r2.location) {
        *part1 = NSMakeRange(r1.location, r2.location);
        CGFloat r2EndLoc = r2.location + r2.length;
        *part2 = NSMakeRange(r2EndLoc, r1.length - r2EndLoc);
    } else /* r1.location == r2.location */ {
        *part2 = NSMakeRange(r2.length, r1.length - r2.length);
    }
}
