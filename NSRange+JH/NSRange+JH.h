/*
 *  NSRange+JH.h
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 10/18/12
 *
 *  Copyright 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */

/* Returns true if CFIndex i is within NSRange r. (Notice the differing types.) */
static inline BOOL NSRangeContainsIndex(NSRange r, CFIndex i) {
    return i < 0 ? NO : ((NSUInteger)i >= r.location && ((NSUInteger)i - r.location) < r.length);
}

/* Returns true if range r1 overlap range r2 */
BOOL NSRangeOverlapsRange( NSRange , NSRange );

/* Returns true if range r1 contains range r2 */
BOOL NSRangeContainsRange( NSRange , NSRange );

/* Returns a new NSRange by taking MIN(r1.loc, r2.loc) and MAX(r1.len, r2.len) */
NSRange NSRangeJoin( NSRange, NSRange );

/* 
 * rr1 will be {NSNotFound,0} if r1.location == r2.location
 * rr1 & rr2 will both be {NSNotFound,0} If r1 does not contain r2 
 */
void NSRangePartition( NSRange , NSRange , NSRange * , NSRange * );
