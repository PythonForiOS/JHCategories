/*
 *  CFRange+JH.h
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 10/18/12
 *
 *  Copyright 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */

/* Returns true if CFIndex i is within CFRange r. */
static inline BOOL CFRangeContainsIndex(CFRange r, CFIndex i) {
    return i >= r.location && (i - r.location) < r.length;
}

/* Returns true if range r1 overlap range r2 */
BOOL CFRangeOverlapsRange( CFRange , CFRange );

/* Returns true if range r1 contains range r2 */
BOOL CFRangeContainsRange( CFRange , CFRange );

/* Returns a new CFRange by taking MIN(r1.loc, r2.loc) and MAX(r1.len, r2.len) */
CFRange CFRangeJoin( CFRange , CFRange );
