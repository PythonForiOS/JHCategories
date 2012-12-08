//
//  NSString+JH.h
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 8/26/11
//
//  Copyright 2011 Jonathan Hosmer
//  http://pythonforios.com
//

#import <MessageUI/MessageUI.h>
#include "Python.h"
#include "pystate.h"

@interface NSString (JH)

- (NSString *)urlencode;
- (unichar)lastCharacter;
- (unichar)firstCharacter;
- (NSString *)makePathFromUrl;
- (NSString *)stringByPrependingMainBundleResourcePath;
- (NSString *)stringByPrependingDocumentsPath;
- (NSString *)stringByPrependingCachesPath;
- (NSString *)repr;
+ (NSString *)stringByPrependingMainBundleResourcePathToFileNamed:(NSString *)fileName;
+ (NSString *)stringByPrependingDocumentsPathToFileNamed:(NSString *)fileName;
+ (NSString *)stringFromFourBitMask:(NSInteger)bitMask;
+ (NSString *)stringFromEightBitMask:(NSInteger)bitMask;
+ (NSString *)stringFromSixteenBitMask:(NSInteger)bitMask;
+ (NSString *)stringFromThirtyTwoBitMask:(NSInteger)bitMask;
+ (NSString *)stringFromBitMask:(NSInteger)bitMask withNumberOfBits:(NSUInteger)numberOfBits;

+ (NSString *)stringRepresentationOfAnimationCurve:(UIViewAnimationCurve)animationCurve;
+ (NSString *)stringRepresentationOfAutoResizing:(UIViewAutoresizing)resizing;
+ (NSString *)stringRepresentationOfBaselineAdjustment:(UIBaselineAdjustment)baseAdjust;
+ (NSString *)stringRepresentationOfBool:(BOOL)theBool;
+ (NSString *)stringRepresentationOfColor:(UIColor *)color;
+ (NSString *)stringRepresentationOfContentMode:(UIViewContentMode)contentMode;
+ (NSString *)stringRepresentationOfDeviceOrientation:(UIDeviceOrientation)orientation;
+ (NSString *)stringRepresentationOfEdgeInsets:(UIEdgeInsets)edgeInsets;
+ (NSString *)stringRepresentationOfFont:(UIFont *)font;
+ (NSString *)stringRepresentationOfIndexPath:(NSIndexPath *)indexPath;
+ (NSString *)stringRepresentationOfInterfaceOrientation:(UIInterfaceOrientation)orientation;
+ (NSString *)stringRepresentationOfLineBreakMode:(UILineBreakMode)lineBreakMode;
+ (NSString *)stringRepresentationOfMFMailComposeResult:(MFMailComposeResult)mailComposeResult;
+ (NSString *)stringRepresentationOfPoint:(CGPoint)point;
+ (NSString *)stringRepresentationOfRange:(NSRange)range;
+ (NSString *)stringRepresentationOfRect:(CGRect)rect;
+ (NSString *)stringRepresentationOfSize:(CGSize)size;
+ (NSString *)stringRepresentationOfStringEncoding:(NSStringEncoding)encoding;
+ (NSString *)stringRepresentationOfTextAlignment:(UITextAlignment)textAlignment;
+ (NSString *)stringRepresentationOfWebViewNavigationType:(UIWebViewNavigationType)navigationType;
+ (NSString *)stringRepresentationOfSignal:(int)sig;
+ (NSString *)stringRepresentationOfStatusBarStyle:(UIStatusBarStyle)style;
+ (NSString *)stringRepresentationOfTextWritingDirection:(UITextWritingDirection)writingDirection;
+ (NSString *)stringRepresentationOfAnimationOptions:(UIViewAnimationOptions)animOptions;

- (BOOL)isSameAsVersion:(NSString *)version;
- (BOOL)isOlderThanVersion:(NSString *)version;
- (BOOL)isNewerThanVersion:(NSString *)version;
- (BOOL)isEmpty;

- (NSInteger)countOccurencesOfString:(NSString*)searchString;
- (NSArray *)linesForFont:(UIFont *)font width:(CGFloat)width lineBreakMode:(UILineBreakMode)breakMode;

+ (NSString *)hexStringFromColor:(CGColorRef)color;
+ (NSString *)stringRepresentationOfPropertyValueNamed:(NSString *)propName ofType:(NSString *)propType forObject:(id)obj;

- (NSString *)stripString:(NSString *)strToStrip;
- (NSString *)stripCharSet:(NSCharacterSet *)charSetToStrip;
- (NSString *)lstripString:(NSString *)strToStrip;
- (NSString *)lstripCharSet:(NSCharacterSet *)charSetToStrip;
- (NSString *)rstripString:(NSString *)strToStrip;
- (NSString *)rstripCharSet:(NSCharacterSet *)charSetToStrip;

+ (NSString *)stringFromFileSize:(int)theSize;
+ (NSString *)humanReadableFileSize:(unsigned long long)fileSize;

//typedef enum {
//    PyGILState_LOCKED,
//    PyGILState_UNLOCKED
//} PyGILState_STATE;

+ (NSString *)stringRepresentationOfPyGILState:(PyGILState_STATE)state;

- (BOOL)isHex;

int signalFromString( NSString * );

- (NSRange)rangeValue;

#pragma mark - ParseKitAdditions
- (NSString *)stringByTrimmingQuotes;

/* Some sweet macros because I'm lazy */
/* Oops.. some of these are SDK funcs for storing strucs in a NSDict as a string! */
#define NSStringFromUIViewAnimationCurve(x)    [NSString stringRepresentationOfAnimationCurve:(x)]
#define NSStringFromUIViewAutoResizing(x)      [NSString stringRepresentationOfAutoResizing:(x)]
#define NSStringFromUIBaselineAdjustment(x)    [NSString stringRepresentationOfBaselineAdjustment:(x)]
#define NSStringFromBOOL(x)                    [NSString stringRepresentationOfBOOL:(x)]
#define NSStringFromUIColor(x)                 [NSString stringRepresentationOfColor:(x)]
#define NSStringFromUIViewContentMode(x)       [NSString stringRepresentationOfViewContentMode:(x)]
#define NSStringFromUIDeviceOrientation(x)     [NSString stringRepresentationOfDeviceOrientation:(x)]
//#define NSStringFromUIEdgeInsets(x)            [NSString stringRepresentationOfEdgeInsets:(x)]
#define NSStringFromUIFont(x)                  [NSString stringRepresentationOfFont:(x)]
#define NSStringFromNSIndexPath(x)             [NSString stringRepresentationOfIndexPath:(x)]
#define NSStringFromUIInterfaceOrientation(x)  [NSString stringRepresentationOfInterfaceOrientation:(x)]
#define NSStringFromUILineBreakMode(x)         [NSString stringRepresentationOfLineBreakMode:(x)]
#define NSStringFromMFMailComposeResult(x)     [NSString stringRepresentationOfMFMailComposeResult:(x)]
//#define NSStringFromCGPoint(x)                 [NSString stringRepresentationOfPoint:(x)]
//#define NSStringFromNSRange(x)                 [NSString stringRepresentationOfRange:(x)]
//#define NSStringFromCGRect(x)                  [NSString stringRepresentationOfRect:(x)]
//#define NSStringFromCGSize(x)                  [NSString stringRepresentationOfSize:(x)]
#define NSStringFromNSStringEncoding(x)        [NSString stringRepresentationOfStringEncoding:(x)]
#define NSStringFromUITextAlignment(x)         [NSString stringRepresentationOfTextAlignment:(x)]
#define NSStringFromUIWebViewNavigationType(x) [NSString stringRepresentationOfWebViewNavigationType:(x)]
#define NSStringFromSignal(x)                  [NSString stringRepresentationOfSignal:(x)]
#define NSStringFromUIStatusBarStyle(x)        [NSString stringRepresentationOfStatusBarStyle:(x)]
#define NSStringFromUITextWritingDirection(x)  [NSString stringRepresentationOfTextWritingDirection:(x)]
#define NSStringfromUIViewAnimationOptions(x)  [NSString stringRepresentationOfAnimationOptions:(x)]

#define NSStringFromPyGILState(x)              [NSString stringRepresentationOfPyGILState:(x)]

@end
