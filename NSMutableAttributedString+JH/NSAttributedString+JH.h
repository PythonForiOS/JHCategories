//
//  NSMutableAttributedString+JH.h
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 6/15/2012
//
//  Copyright 2012 Jonathan Hosmer
//  http://pythonforios.com
//

#import <CoreText/CoreText.h>

@interface NSAttributedString (JH)
- (CGFloat)boundingWidthForHeight:(CGFloat)inHeight;
- (CGFloat)boundingHeightForWidth:(CGFloat)inWidth;
- (NSRange)rangeValue;
@end

@interface NSMutableAttributedString (JH)
+ (id)mutableAttributedStringWithString:(NSString *)string
                                   font:(UIFont *)font 
                                  color:(UIColor *)color 
                              alignment:(CTTextAlignment)alignment;
@end
