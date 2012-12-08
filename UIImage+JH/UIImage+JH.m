//
//  UIImage-Extended.m
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 9/30/11
//
//  Copyright 2011 Jonathan Hosmer
//  http://pythonforios.com
//

#import "UIImage+JH.h"

@implementation UIImage (JH)

+ (UIImage *)imageWithName:(NSString *)name {
    return [[[UIImage alloc] initWithContentsOfFile:[NSString stringWithFormat:@"%@/%@", [[NSBundle mainBundle] resourcePath], name]] autorelease];
}

- (UIImage *)scaledToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage* scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

- (UIImage *)imageByCroppingToRect:(CGRect)rect {
    CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);
    UIImage *croppedImage = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    return croppedImage;
}

- (CGSize)fontSizeForLabel:(UILabel *)label {
	CGSize maxSize = CGSizeMake(CGRectGetWidth(label.frame), INT16_MAX);
	CGSize expectedLabelSize = [label.text sizeWithFont:label.font
                                      constrainedToSize:maxSize
                                          lineBreakMode:UILineBreakModeWordWrap];
	return expectedLabelSize;
}

@end
