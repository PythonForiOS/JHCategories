/*
 *  UIColor+JH.h
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 1/8/12
 *
 *  Copyright 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
@interface UIColor (JH)

+ (UIColor *)colorWithHex:(UInt32)col;
+ (UIColor *)colorWithHexString:(NSString *)str;
- (UIColor *)contrastingColor;
- (BOOL)contrastingColorIsWhite;

@end

