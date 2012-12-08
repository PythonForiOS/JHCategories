/*
 *  UIApplication+JH.m
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 12/24/11
 *
 *  Copyright (c) 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
#import "UIApplication+JH.h"
    
@implementation UIApplication (JH)

+ (CGFloat)statusBarHeight {
    return MIN(CGRectGetHeight([UIApplication sharedApplication].statusBarFrame), CGRectGetWidth([UIApplication sharedApplication].statusBarFrame));
}

@end

