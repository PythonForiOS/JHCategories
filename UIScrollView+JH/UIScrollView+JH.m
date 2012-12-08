/*
 *  UIScrollView-Extended.m
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 11/26/11
 *
 *  Copyright 2011-2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
#import "UIScrollView+JH.h"
    
@implementation UIScrollView (JH)

- (void)adjustWidth:(BOOL)changeWidth andHeight:(BOOL)changeHeight withHorizontalPadding:(NSInteger)horizontalPadding andVerticalPadding:(NSInteger)verticalPadding {
    CGFloat contentWidth = horizontalPadding;
    CGFloat contentHeight = verticalPadding;
    for (UIView *subview in self.subviews) {
        [subview sizeToFit];
        contentWidth += CGRectGetWidth(subview.frame);
        contentHeight += CGRectGetHeight(subview.frame);
    }
    contentWidth = changeWidth ? contentWidth : CGRectGetWidth(self.superview.frame);
    contentHeight = changeHeight ? contentHeight : CGRectGetHeight(self.superview.frame);
    self.contentSize = CGSizeMake(contentWidth, contentHeight);
}

- (void)adjustHeightForCurrentSubviews:(NSInteger)verticalPadding {
    [self adjustWidth:NO andHeight:YES withHorizontalPadding:0 andVerticalPadding:verticalPadding];
}

- (void)adjustWidthForCurrentSubviews:(NSInteger)horizontalPadding {
    [self adjustWidth:YES andHeight:NO withHorizontalPadding:horizontalPadding andVerticalPadding:0];
}

@end

