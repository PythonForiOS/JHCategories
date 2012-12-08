//
//  UITextView-Extended.m
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 8/29/11
//
//  Copyright 2011 Jonathan Hosmer
//  http://pythonforios.com
//

#import "UITextView+JH.h"

@implementation UITextView (JH)

- (void)rotate360WithDuration:(CGFloat)aDuration repeatCount:(CGFloat)aRepeatCount timingMode:(i7Rotate360TimingMode)aMode {
	CAKeyframeAnimation *theAnimation = [CAKeyframeAnimation animation];
	theAnimation.values = [NSArray arrayWithObjects:
						   [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0.00, 0, 0, 1)],
						   [NSValue valueWithCATransform3D:CATransform3DMakeRotation(3.13, 0, 0, 1)],
						   [NSValue valueWithCATransform3D:CATransform3DMakeRotation(6.26, 0, 0, 1)],
						   nil];
	theAnimation.cumulative = YES;
	theAnimation.duration = aDuration;
	theAnimation.repeatCount = aRepeatCount;
	theAnimation.removedOnCompletion = YES;
	id timingFunction;
    switch (aMode) {
        case i7Rotate360TimingModeEaseIn:
            timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            break;
        case i7Rotate360TimingModeLinear:
            timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
            break;
        case i7Rotate360TimingModeEaseOut:
            timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
            break;
        case i7Rotate360TimingModeEaseInEaseOut:
            timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            break;
        case i7Rotate360TimingModeDefault:
        default:
            timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
            break;
    }
    theAnimation.timingFunction = timingFunction;
    
//	if (aMode == i7Rotate360TimingModeEaseInEaseOut) {
//        id timingFunctionIn = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//        id timingFunctionOut = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//		theAnimation.timingFunctions = [NSArray arrayWithObjects:timingFunctionIn, timingFunctionOut, nil];
//	} else if (aMode == i7Rotate360TimingModeEaseIn) {
//        theAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    }
	[self.layer addAnimation:theAnimation forKey:@"transform"];
}

- (void)rotate360WithDuration:(CGFloat)aDuration timingMode:(i7Rotate360TimingMode)aMode {
	[self rotate360WithDuration:aDuration repeatCount:1 timingMode:aMode];
}

- (void)rotate360WithDuration:(CGFloat)aDuration {
	[self rotate360WithDuration:aDuration repeatCount:1 timingMode:i7Rotate360TimingModeEaseInEaseOut];
}

@end
