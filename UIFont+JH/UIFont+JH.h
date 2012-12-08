//
//  UIFont+JH.h
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 6/15/2012
//
//  Copyright 2012 Jonathan Hosmer
//  http://pythonforios.com
//

#import <CoreText/CoreText.h>

@interface UIFont (JH)

+ (id)fontWithCTFont:(CTFontRef)ctFont;
- (CTFontRef)CTFontRef;
- (CGFloat)trueLineHeight;
- (CGFloat)lineHeightAtScale:(CGFloat)scale;
@end
