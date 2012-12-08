//
//  UIFont+JH.m
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 6/15/2012
//
//  Copyright 2012 Jonathan Hosmer
//  http://pythonforios.com
//

#import "UIFont+JH.h"

@implementation UIFont (JH)

+ (id)fontWithCTFont:(CTFontRef)ctFont {
    if (!ctFont) return nil;
    
    UIFont *uiFont;
    CFStringRef fontName = CTFontCopyPostScriptName(ctFont);
    CGFloat fontSize = CTFontGetSize(ctFont);
    uiFont = [UIFont fontWithName:(NSString *)fontName size:fontSize];
    CFRelease(fontName);
    
    return uiFont;
}

- (CTFontRef)CTFontRef {
    return CTFontCreateWithName((CFStringRef)[self fontName], [self pointSize], NULL);
}

- (CGFloat)trueLineHeight {
    return [self lineHeightAtScale:1.0];
}

- (CGFloat)lineHeightAtScale:(CGFloat)scale {
    CTFontRef ctFont;
    CGFloat ascent, descent, leading, lineHeight, ascenderDelta;
    CGFloat normScale = MAX(1, scale);
    if ((ctFont = [self CTFontRef]) == nil) return 0;
    
    ascent = CTFontGetAscent(ctFont) * normScale;
    descent = CTFontGetDescent(ctFont) * normScale;
    leading = MAX(0, CTFontGetLeading(ctFont) * normScale);
    leading = floor(leading + 0.5f);
    lineHeight = floor(ascent + 0.5f) + floor(descent + 0.5f) + leading;
    ascenderDelta = (leading > 0 ? 0 : floor(0.2f * lineHeight + 0.5f));
    return lineHeight + ascenderDelta;
}

@end
