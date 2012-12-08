//
//  UINavigationController-Extended.m
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 9/19/11
//
//  Copyright 2011 Jonathan Hosmer
//  http://pythonforios.com
//

#import "UINavigationController+JH.h"

@implementation UINavigationController (JHTabBarController)

- (NSString *)iconImageName {
	return [[self.viewControllers objectAtIndex:0] iconImageName];
}

+ (CGFloat)navBarHeight {
    return 44.0f;
}

- (CGFloat)navigationBarHeight {
    return MIN(CGRectGetWidth(self.navigationBar.frame), CGRectGetHeight(self.navigationBar.frame));
}


- (BOOL)disablesAutomaticKeyboardDismissal {
    return NO;
}

@end
