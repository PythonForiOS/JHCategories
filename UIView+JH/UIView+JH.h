//
//  UIView-Extended.h
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 8/26/11
//
//  Copyright 2011 Jonathan Hosmer
//  http://pythonforios.com
//

@interface UIView (JH)

- (UIView *)findFirstResponder;
- (UIView *)setFirstResponder:(NSInteger)viewTag;
//- (NSString*)listColor:(UIColor *)color;
//- (NSString *)descriptionTextForView:(UIView *)v indent:(NSInteger)level;
//- (NSString *)describeView:(UIView*)view indent:(NSInteger)level;
//- (NSString *)description;
- (void)dismissKeyboard_NONPRIVATEAPIMETHOD:(id)sender;
- (void)nextPrevious:(id)sender;
- (void)printDescription;
- (void)printPropValDict;
- (NSString *)subviewProperties;

@end
