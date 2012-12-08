/*
 *  CFRange+JH.m
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 10/18/12
 *
 *  Copyright 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */

#import "CFRange+JH.h"

BOOL CFRangeOverlapsRange(CFRange r1, CFRange r2) {
    if (r1.location < r2.location) {
        return ( r2.location - r1.location ) < r1.length;
    } else if (r1.location > r2.location) {
        return ( r1.location - r2.location ) < r2.length;
    } else {
        /* Same start location */
        return r1.length > 0 && r2.length > 0;
    }
}

BOOL CFRangeContainsRange(CFRange r1, CFRange r2) {
    return (r1.location < r2.location ? NO : ((r1.location + r1.length) > (r2.location + r2.length) ? NO : YES));
//    if (r1.location < r2.location)
//        return NO;
//    
//    if ((r1.location + r1.length) > (r2.location + r2.length))
//        return NO;
//    
//    return YES;
}

CFRange CFRangeJoin(CFRange r1, CFRange r2) {
    return (CFRange)
    {
        MIN(r1.location, r2.location),
        MAX(r1.length, r2.length),
    };
}
