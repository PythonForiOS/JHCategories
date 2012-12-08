/*
 *  CTFontRef+JH.m
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 8/26/12
 *
 *  Copyright 2012 Jonathan Hosmer
 *  http://hozbox.com
 */

#import "CTFontRef+JH.h"

CGFloat CTFontLineHeight(CTFontRef ctFont) {
    return CTFontLineHeightAtScale(ctFont, 1);
}

CGFloat CTFontLineHeightAtScale(CTFontRef ctFont, CGFloat scale) {
    CGFloat ascent, descent, leading, lineHeight, ascenderDelta;
    ascent = CTFontGetAscent(ctFont) * scale;
    descent = CTFontGetDescent(ctFont) * scale;
    leading = MAX(0, CTFontGetLeading(ctFont) * scale);
    leading = floor(leading + .5);
    lineHeight = floor(ascent + .5) + floor(descent + .5) + leading;
    ascenderDelta = (leading > 0 ? 0 : floor(.2 * lineHeight + .5));
    return lineHeight + ascenderDelta;
}
