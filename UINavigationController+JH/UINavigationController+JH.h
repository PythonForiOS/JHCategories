//
//  UINavigationController-Extended.h
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 9/19/11
//
//  Copyright 2011 Jonathan Hosmer
//  http://pythonforios.com
//

@interface UINavigationController (JHTabBarController)

- (NSString *)iconImageName;
+ (CGFloat)navBarHeight;
- (CGFloat)navigationBarHeight;
- (BOOL)disablesAutomaticKeyboardDismissal;

@end
