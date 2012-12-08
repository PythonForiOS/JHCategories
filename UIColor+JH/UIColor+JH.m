/*
 *  UIColor+JH.m
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 1/8/12
 *
 *  Copyright 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
#import "UIColor+JH.h"
    
@implementation UIColor (JH)

/*
 * takes 0x123456
 */
+ (UIColor *)colorWithHex:(UInt32)col {
    unsigned char r, g, b;
    b = col & 0xFF;
    g = (col >> 8) & 0xFF;
    r = (col >> 16) & 0xFF;
    return [UIColor colorWithRed:(float)r/255.f green:(float)g/255.f blue:(float)b/255.f alpha:1.f];
}



/*
 * takes @"#123456" or @"AB12F9"
 */
+ (UIColor *)colorWithHexString:(NSString *)str {
    NSAssert((str.length >= 6 && str.length <= 8), @"Can't convert hex string to color representation: %@", str);
    if (str.length < 6 || str.length > 8)
        return nil;

    unsigned char r, g, b;
    unsigned hexInt;
    
    NSScanner *hexScanner = [NSScanner scannerWithString:str];
    [hexScanner setCharactersToBeSkipped:[NSCharacterSet symbolCharacterSet]];
    [hexScanner scanHexInt:&hexInt];
    r = (hexInt >> 16) & 0xFF;
    g = (hexInt >> 8) & 0xFF; //0x00FF00;
    b = (hexInt >> 0) & 0xFF; //0x0000FF;
    return [UIColor colorWithRed:(float)r/255.f
                           green:(float)g/255.f
                            blue:(float)b/255.f
                           alpha:1.f];
//    int skipChar = (int)([str firstCharacter] == '#');
//    const char *cStr = [str cStringUsingEncoding:NSASCIIStringEncoding];
//    long x = strtol(cStr + skipChar, NULL, 16);
//    return [UIColor colorWithHex:x];
}

/* R*0.299f + G*0.587f + B*0.114f - 186
 *    186 set as the middle value (rather than 128)
 * <  186 should use white text
 * >= 186 should use black text
 */
- (UIColor *)contrastingColor {
    CGFloat r, g, b;
    if (![self getRed:&r green:&g blue:&b alpha:NULL]) return nil;
    
    CGFloat redModifier = .299f, greenModifier = .587f, blueModifier = .114f;
    r *= 255.f * redModifier;
    g *= 255.f * greenModifier;
    b *= 255.f * blueModifier;
    return r + g + b < 186 ? [UIColor whiteColor] : [UIColor blackColor];
}

- (BOOL)contrastingColorIsWhite {
    CGFloat r, g, b;
    if (![self getRed:&r green:&g blue:&b alpha:NULL]) return NO;
    
    CGFloat redModifier = .299f, greenModifier = .587f, blueModifier = .114f;
    r *= 255.f * redModifier;
    g *= 255.f * greenModifier;
    b *= 255.f * blueModifier;
    return r + g + b < 186 ? YES : NO;
}

@end

