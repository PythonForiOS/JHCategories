//
//  UIImage-Extended.h
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 9/30/11
//
//  Copyright 2011 Jonathan Hosmer
//  http://pythonforios.com
//

@interface UIImage (JH)

+ (UIImage *)imageWithName:(NSString *)name;
- (UIImage *)scaledToSize:(CGSize)size;
- (UIImage *)imageByCroppingToRect:(CGRect)rect;
- (CGSize)fontSizeForLabel:(UILabel *)label;

@end
