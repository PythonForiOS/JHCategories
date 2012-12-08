/*
 *  UIScrollView-Extended.h
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 11/26/11
 *
 *  Copyright 2011-2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
@interface UIScrollView (JH)

- (void)adjustHeightForCurrentSubviews:(NSInteger)verticalPadding;
- (void)adjustWidthForCurrentSubviews:(NSInteger)horizontalPadding;
- (void)adjustWidth:(BOOL)changeWidth andHeight:(BOOL)changeHeight withHorizontalPadding:(NSInteger)horizontalPadding andVerticalPadding:(NSInteger)verticalPadding;

@end

