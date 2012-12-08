//
//  UITextView-Extended.h
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 8/29/11
//
//  Copyright 2011 Jonathan Hosmer
//  http://pythonforios.com
//

typedef enum {
    i7Rotate360TimingModeLinear,
    i7Rotate360TimingModeEaseIn,
    i7Rotate360TimingModeEaseOut,
    i7Rotate360TimingModeDefault,
    i7Rotate360TimingModeEaseInEaseOut,
} i7Rotate360TimingMode;

@interface UITextView (JH)

- (void)rotate360WithDuration:(CGFloat)aDuration repeatCount:(CGFloat)aRepeatCount timingMode:(i7Rotate360TimingMode)aMode;
- (void)rotate360WithDuration:(CGFloat)aDuration timingMode:(i7Rotate360TimingMode)aMode;
- (void)rotate360WithDuration:(CGFloat)aDuration;

@end
