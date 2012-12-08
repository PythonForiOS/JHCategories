//
//  NSString+JH.m
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 8/26/11
//
//  Copyright 2011 Jonathan Hosmer
//  http://pythonforios.com
//

#import "NSString+JH.h"

@implementation NSString (JH)

- (NSString *)urlencode {
    NSMutableString *output = [NSMutableString string];
    const unsigned char *source = (const unsigned char *)[self UTF8String];
    int sourceLen = strlen((const char *)source);
    for (int i = 0; i < sourceLen; ++i) {
        const unsigned char thisChar = source[i];
        if (thisChar == ' '){
            [output appendString:@"+"];
        } else if (thisChar == '.' || thisChar == '-' || thisChar == '_' || thisChar == '~' ||
                   (thisChar >= 'a' && thisChar <= 'z') ||
                   (thisChar >= 'A' && thisChar <= 'Z') ||
                   (thisChar >= '0' && thisChar <= '9')) {
            [output appendFormat:@"%c", thisChar];
        } else {
            [output appendFormat:@"%%%02X", thisChar];
        }
    }
    return output;
}

- (unichar)lastCharacter {
    return [self characterAtIndex:self.length - 1];
}

- (unichar)firstCharacter {
    return [self characterAtIndex:0];
}

- (NSString *)makePathFromUrl {
        NSRange replaceRange = [self rangeOfString:@".visibleapps.com"];
        replaceRange.length += replaceRange.location;
        replaceRange.location = 0;
        NSString *path = [self stringByReplacingCharactersInRange:replaceRange withString:@""];
        return path;
}

- (NSString *)stringByPrependingMainBundleResourcePath {
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:self];
}

- (NSString *)stringByPrependingDocumentsPath {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	return [paths count] ? [[paths lastObject] stringByAppendingPathComponent:self] : self;
}

- (NSString *)stringByPrependingCachesPath {
    return [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:self];
}

- (NSString *)repr {
    NSMutableString *myRepr = [[NSMutableString alloc] initWithString:self];
    NSRange myRange = NSMakeRange(0, [self length]);
    NSArray *toReplace = [NSArray arrayWithObjects:@"\0", @"\a", @"\b", @"\t", @"\n", @"\f", @"\r", @"\e", nil];
    NSArray *replaceWith = [NSArray arrayWithObjects:@"\\0", @"\\a", @"\\b", @"\\t", @"\\n", @"\\f", @"\\r", @"\\e", nil];
    for (int i = 0, count = [toReplace count]; i < count; ++i) {
        [myRepr replaceOccurrencesOfString:[toReplace stringAtIndex:i] withString:[replaceWith stringAtIndex:i] options:kNilOptions range:myRange];
    }
    NSString *retStr = [NSString stringWithString:myRepr];
    [myRepr release], myRepr = nil;
    return retStr;
}

+ (NSString *)stringByPrependingMainBundleResourcePathToFileNamed:(NSString *)fileName {
    return [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:fileName];
}

+ (NSString *)stringByPrependingDocumentsPathToFileNamed:(NSString *)fileName {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	return [paths count] ? [[paths lastObject] stringByAppendingPathComponent:fileName] : fileName;
}


+ (NSString *)stringFromFourBitMask:(NSInteger)bitMask {
    return [NSString stringFromBitMask:bitMask withNumberOfBits:4];
}

+ (NSString *)stringFromEightBitMask:(NSInteger)bitMask {
    return [NSString stringFromBitMask:bitMask withNumberOfBits:8];
}

+ (NSString *)stringFromSixteenBitMask:(NSInteger)bitMask {
    return [NSString stringFromBitMask:bitMask withNumberOfBits:16];
}

+ (NSString *)stringFromThirtyTwoBitMask:(NSInteger)bitMask {
    return [NSString stringFromBitMask:bitMask withNumberOfBits:32];
}

+ (NSString *)stringFromBitMask:(NSInteger)bitMask withNumberOfBits:(NSUInteger)numberOfBits {
    NSMutableString *str = [NSMutableString string];
    NSInteger numberCopy = bitMask;
    for(NSUInteger i = 0; i < numberOfBits ; ++i) {
        [str insertString:((numberCopy & 1) ? @"1" : @"0") atIndex:0];
        numberCopy >>= 1;
    }
    return str;
}


+ (NSString *)stringRepresentationOfAnimationCurve:(UIViewAnimationCurve)animationCurve {
    NSString *animCurveString = nil;
    switch (animationCurve) {
        case UIViewAnimationCurveEaseIn:
            animCurveString = @"UIViewAnimationCurveEaseIn";
            break;
        case UIViewAnimationCurveEaseInOut:
            animCurveString = @"UIViewAnimationCurveEaseInOut";
            break;
        case UIViewAnimationCurveEaseOut:
            animCurveString = @"UIViewAnimationCurveEaseOut";
            break;
        case UIViewAnimationCurveLinear:
            animCurveString = @"UIViewAnimationCurveLinear";
            break;
        default:
            animCurveString = @"UNKNOWN";
            break;
    }
    return animCurveString;
}

+ (NSString *)stringRepresentationOfAutoResizing:(UIViewAutoresizing)resizing {
    NSString *resizingString = nil;
    if (!resizing) {
        resizingString = @"UIViewAutoresizingNone";
    } else {
        NSArray *maskNames = [NSArray arrayWithObjects:@"UIViewAutoresizingFlexibleLeftMargin", @"UIViewAutoresizingFlexibleWidth", @"UIViewAutoresizingFlexibleRightMargin", @"UIViewAutoresizingFlexibleTopMargin", @"UIViewAutoresizingFlexibleHeight", @"UIViewAutoresizingFlexibleBottomMargin", nil];
        NSArray *maskVars = [NSArray arrayWithObjects:[NSNumber numberWithInt:UIViewAutoresizingFlexibleLeftMargin], [NSNumber numberWithInt:UIViewAutoresizingFlexibleWidth], [NSNumber numberWithInt:UIViewAutoresizingFlexibleRightMargin], [NSNumber numberWithInt:UIViewAutoresizingFlexibleTopMargin], [NSNumber numberWithInt:UIViewAutoresizingFlexibleHeight], [NSNumber numberWithInt:UIViewAutoresizingFlexibleBottomMargin], nil];
        for (int i = 0, count = [maskVars count]; i < count; ++i) {
            if (resizing & (UIViewAutoresizing)[[maskVars objectAtIndex:i] intValue]) {
                if (!resizingString) {
                    resizingString = [maskNames objectAtIndex:i];
                } else {
                    resizingString = [resizingString stringByAppendingFormat:@"|%@", [maskNames objectAtIndex:i]];
                }
            }
        }
    }
    return resizingString;
}

+ (NSString *)stringRepresentationOfBaselineAdjustment:(UIBaselineAdjustment)baseAdjust {
    NSString *string = nil;
    switch (baseAdjust) {
        case UIBaselineAdjustmentNone:
            string = @"UIBaselineAdjustmentNone";
            break;
        case UIBaselineAdjustmentAlignCenters:
            string = @"UIBaselineAdjustmentAlignCenters";
            break;
        case UIBaselineAdjustmentAlignBaselines:
            string = @"UIBaselineAdjustmentAlignBaselines";
            break;
        default:
            break;
    }
    return string;
}

+ (NSString *)stringRepresentationOfBool:(BOOL)theBool {
    return [NSString stringWithFormat:@"%@", (theBool ? @"YES" : @"NO")];
}

+ (NSString *)stringRepresentationOfColor:(UIColor *)color {
    CGFloat red, green, blue, alpha;
    [color getRed:&red green:&green blue:&blue alpha:&alpha];
    return [NSString stringWithFormat:@"Red: %0.1f/255.0 - Green: %0.1f/255.0 - Blue: %0.1f/255.0 - Alpha: %0.1f/100.0", (red * 255.0), (green * 255.0), (blue * 255.0), (alpha * 100.0)];
}

+ (NSString *)stringRepresentationOfContentMode:(UIViewContentMode)contentMode {
    NSString *contentModeString = nil;
    switch (contentMode) {
        case UIViewContentModeBottom:
            contentModeString = @"UIViewContentModeBottom";
            break;
        case UIViewContentModeBottomLeft:
            contentModeString = @"UIViewContentModeBottomLeft";
            break;
        case UIViewContentModeBottomRight:
            contentModeString = @"UIViewContentModeBottomRight";
            break;
        case UIViewContentModeCenter:
            contentModeString = @"UIViewContentModeCenter";
            break;
        case UIViewContentModeLeft:
            contentModeString = @"UIViewContentModeLeft";
            break;
        case UIViewContentModeRedraw:
            contentModeString = @"UIViewContentModeRedraw";
            break;
        case UIViewContentModeRight:
            contentModeString = @"UIViewContentModeRight";
            break;
        case UIViewContentModeScaleAspectFill:
            contentModeString = @"UIViewContentModeScaleAspectFill";
            break;
        case UIViewContentModeScaleAspectFit:
            contentModeString = @"UIViewContentModeScaleAspectFit";
            break;
        case UIViewContentModeScaleToFill:
            contentModeString = @"UIViewContentModeScaleToFill";
            break;
        case UIViewContentModeTop:
            contentModeString = @"UIViewContentModeTop";
            break;
        case UIViewContentModeTopLeft:
            contentModeString = @"UIViewContentModeTopLeft";
            break;
        case UIViewContentModeTopRight:
            contentModeString = @"UIViewContentModeTopRight";
            break;
        default:
            contentModeString = @"UNKNOWN";
            break;
    }
    return contentModeString;
}

+ (NSString *)stringRepresentationOfDeviceOrientation:(UIDeviceOrientation)orientation {
    NSString *orientName = nil;
    switch (orientation) {
        case UIDeviceOrientationFaceDown:
            orientName = @"UIDeviceOrientationFaceDown";
            break;
        case UIDeviceOrientationFaceUp:
            orientName = @"UIDeviceOrientationFaceUp";
            break;
        case UIDeviceOrientationLandscapeLeft:
            orientName = @"UIDeviceOrientationLandscapeLeft";
            break;
        case UIDeviceOrientationLandscapeRight:
            orientName = @"UIDeviceOrientationLandscapeRight";
            break;
        case UIDeviceOrientationPortrait:
            orientName = @"UIDeviceOrientationPortrait";
            break;
        case UIDeviceOrientationPortraitUpsideDown:
            orientName = @"UIDeviceOrientationPortraitUpsideDown";
            break;
        case UIDeviceOrientationUnknown:
            orientName = @"UIDeviceOrientationUnknown";
            break;
        default:
            orientName = @"(null)";
            break;
    }
    return orientName;
}

+ (NSString *)stringRepresentationOfEdgeInsets:(UIEdgeInsets)edgeInsets {
    return [NSString stringWithFormat:@"insets={top=%f, left=%f, bottom=%f, right=%f}", edgeInsets.top, edgeInsets.left, edgeInsets.bottom, edgeInsets.right];
}

+ (NSString *)stringRepresentationOfFont:(UIFont *)font {
    return [NSString stringWithFormat:@"Font (%@): <Family: %@ / Point Size: %f / Line Height: %f / Cap Height: %f / xHeight: %f / Ascender: %f / Descender: %f>",
            [font fontName],
            [font familyName],
            [font pointSize],
            [font lineHeight],
            [font capHeight],
            [font xHeight],
            [font ascender],
            [font descender]];
}

+ (NSString *)stringRepresentationOfIndexPath:(NSIndexPath *)indexPath {
    return [NSString stringWithFormat:@"<IndexPath Section: %d  --  Row: %d>", [@(indexPath.section) intValue], [@(indexPath.row) intValue]];
}

+ (NSString *)stringRepresentationOfInterfaceOrientation:(UIInterfaceOrientation)orientation {
    NSString *orientName = nil;;
    switch (orientation) {
        case UIInterfaceOrientationPortrait:
            orientName = @"UIInterfaceOrientationPortrait";
            break;
        case UIInterfaceOrientationPortraitUpsideDown:
            orientName = @"UIInterfaceOrientationPortraitUpsideDown";
            break;
        case UIInterfaceOrientationLandscapeLeft:
            orientName = @"UIInterfaceOrientationLandscapeLeft";
            break;
        case UIInterfaceOrientationLandscapeRight:
            orientName = @"UIInterfaceOrientationLandscapeRight";
            break;
        default:
            orientName = @"(null)";
            break;
    }
    return orientName;
}

+ (NSString *)stringRepresentationOfLineBreakMode:(UILineBreakMode)lineBreakMode {
    NSString *string = nil;
    switch (lineBreakMode) {
        case UILineBreakModeWordWrap:
            string = @"UILineBreakModeWordWrap";
            break;
        case UILineBreakModeCharacterWrap:
            string = @"UILineBreakModeCharacterWrap";
            break;
        case UILineBreakModeClip:
            string = @"UILineBreakModeClip";
            break;
        case UILineBreakModeHeadTruncation:
            string = @"UILineBreakModeHeadTruncation";
            break;
        case UILineBreakModeMiddleTruncation:
            string = @"UILineBreakModeMiddleTruncation";
            break;
        case UILineBreakModeTailTruncation:
            string = @"UILineBreakModeTailTruncation";
            break;
        default:
            break;
    }
    return string;
}

+ (NSString *)stringRepresentationOfMFMailComposeResult:(MFMailComposeResult)mailComposeResult {
    NSString *mailComposeResultName = nil;;
    switch (mailComposeResult) {
        case MFMailComposeResultCancelled:
            mailComposeResultName = @"MFMailComposeResultCancelled";
            break;
        case MFMailComposeResultSaved:
            mailComposeResultName = @"MFMailComposeResultSaved";
            break;
        case MFMailComposeResultSent:
            mailComposeResultName = @"MFMailComposeResultSent";
            break;
        case MFMailComposeResultFailed:
            mailComposeResultName = @"MFMailComposeResultFailed";
            break;
        default:
            mailComposeResultName = @"(null)";
            break;
    }
    return mailComposeResultName;
}

+ (NSString *)stringRepresentationOfPoint:(CGPoint)point {
    return [NSString stringWithFormat:@"{%f, %f}", point.x, point.y];
}

+ (NSString *)stringRepresentationOfRange:(NSRange)range {
    return [NSString stringWithFormat:@"location=%d, length=%d", [@(range.location) intValue], [@(range.length) intValue]];
}

+ (NSString *)stringRepresentationOfRect:(CGRect)rect {
    return [NSString stringWithFormat:@"origin=(%f, %f), size=(%f, %f)", CGRectGetMinX(rect), CGRectGetMinY(rect), CGRectGetWidth(rect), CGRectGetHeight(rect)];
}

+ (NSString *)stringRepresentationOfSize:(CGSize)size {
    return [NSString stringWithFormat:@"size=(%f, %f)", size.width, size.height];
}

+ (NSString *)stringRepresentationOfStringEncoding:(NSStringEncoding)encoding {
    NSString *encodingString;
    
    switch (encoding) {
        case NSASCIIStringEncoding:
            encodingString = @"NSASCIIStringEncoding";
            break;
            
        case NSNEXTSTEPStringEncoding:
            encodingString = @"NSNEXTSTEPStringEncoding";
            break;
        case NSJapaneseEUCStringEncoding:
            encodingString = @"NSJapaneseEUCStringEncoding";
            break;
        case NSUTF8StringEncoding:
            encodingString = @"NSUTF8StringEncoding";
            break;
        case NSISOLatin1StringEncoding:
            encodingString = @"NSISOLatin1StringEncoding";
            break;
        case NSSymbolStringEncoding:
            encodingString = @"NSSymbolStringEncoding";
            break;
        case NSNonLossyASCIIStringEncoding:
            encodingString = @"NSNonLossyASCIIStringEncoding";
            break;
        case NSShiftJISStringEncoding:
            encodingString = @"NSShiftJISStringEncoding";
            break;
        case NSISOLatin2StringEncoding:
            encodingString = @"NSISOLatin2StringEncoding";
            break;
        case NSUnicodeStringEncoding: /* Alias: NSUTF16StringEncoding */
            encodingString = @"NSUnicodeStringEncoding (NSUTF16StringEncoding)";
            break;
        case NSWindowsCP1251StringEncoding:
            encodingString = @"NSWindowsCP1251StringEncoding";
            break;
        case NSWindowsCP1252StringEncoding:
            encodingString = @"NSWindowsCP1252StringEncoding";
            break;
        case NSWindowsCP1253StringEncoding:
            encodingString = @"NSWindowsCP1253StringEncoding";
            break;
        case NSWindowsCP1254StringEncoding:
            encodingString = @"NSWindowsCP1254StringEncoding";
            break;
        case NSWindowsCP1250StringEncoding:
            encodingString = @"NSWindowsCP1250StringEncoding";
            break;
        case NSISO2022JPStringEncoding:
            encodingString = @"NSISO2022JPStringEncoding";
            break;
        case NSMacOSRomanStringEncoding:
            encodingString = @"NSMacOSRomanStringEncoding";
            break;
            
        case NSUTF16BigEndianStringEncoding:
            encodingString = @"NSUTF16BigEndianStringEncoding";
            break;
        case NSUTF16LittleEndianStringEncoding:
            encodingString = @"NSUTF16LittleEndianStringEncoding";
            break;
            
        case NSUTF32StringEncoding:
            encodingString = @"NSUTF32StringEncoding";
            break;
        case NSUTF32BigEndianStringEncoding:
            encodingString = @"NSUTF32BigEndianStringEncoding";
            break;
        case NSUTF32LittleEndianStringEncoding:
            encodingString = @"NSUTF32LittleEndianStringEncoding";
            break;
        default:
            encodingString = @"Unknown/Invalid String Encoding";
            break;
    }
    return encodingString;
}

+ (NSString *)stringRepresentationOfTextAlignment:(UITextAlignment)textAlignment {
    NSString *string = nil;
    switch (textAlignment) {
        case UITextAlignmentLeft:
            string = @"UITextAlignmentLeft";
            break;
        case UITextAlignmentRight:
            string = @"UITextAlignmentRight";
            break;
        case UITextAlignmentCenter:
            string = @"UITextAlignmentCenter";
            break;
        default:
            break;
    }
    return string;
}

+ (NSString *)stringRepresentationOfWebViewNavigationType:(UIWebViewNavigationType)navigationType {
    NSString *navName = nil;;
    switch (navigationType) {
        case UIWebViewNavigationTypeLinkClicked:
            navName = @"UIWebViewNavigationTypeLinkClicked";
            break;
        case UIWebViewNavigationTypeFormSubmitted:
            navName = @"UIWebViewNavigationTypeFormSubmitted";
            break;
        case UIWebViewNavigationTypeBackForward:
            navName = @"UIWebViewNavigationTypeBackForward";
            break;
        case UIWebViewNavigationTypeReload:
            navName = @"UIWebViewNavigationTypeReload";
            break;
        case UIWebViewNavigationTypeFormResubmitted:
            navName = @"UIWebViewNavigationTypeFormResubmitted";
            break;
        case UIWebViewNavigationTypeOther:
            navName = @"UIWebViewNavigationTypeOther";
            break;
        default:
            navName = @"(null)";
            break;
    }
    return navName;
}

+ (NSString *)stringRepresentationOfSignal:(int)sig {
    NSString *sigName = nil;
    switch (sig) {
        case SIGHUP:
            sigName = @"SIGHUP";
            break;
        case SIGINT:
            sigName = @"SIGINT";
            break;
        case SIGQUIT:
            sigName = @"SIGQUIT";
            break;
        case SIGILL:
            sigName = @"SIGILL";
            break;
        case SIGTRAP:
            sigName = @"SIGTRAP";
            break;
        case SIGABRT:
            sigName = @"SIGABRT";
            break;
        case SIGFPE:
            sigName = @"SIGFPE";
            break;
        case SIGKILL:
            sigName = @"SIGKILL";
            break;
        case SIGBUS:
            sigName = @"SIGBUS";
            break;
        case SIGSEGV:
            sigName = @"SIGSEGV";
            break;
        case SIGSYS:
            sigName = @"SIGSYS";
            break;
        case SIGPIPE:
            sigName = @"SIGPIPE";
            break;
        case SIGALRM:
            sigName = @"SIGALRM";
            break;
        case SIGTERM:
            sigName = @"SIGTERM";
            break;
        case SIGURG:
            sigName = @"SIGURG";
            break;
        case SIGSTOP:
            sigName = @"SIGSTOP";
            break;
        case SIGTSTP:
            sigName = @"SIGTSTP";
            break;
        case SIGCONT:
            sigName = @"SIGCONT";
            break;
        case SIGCHLD:
            sigName = @"SIGCHLD";
            break;
        case SIGTTIN:
            sigName = @"SIGTTIN";
            break;
        case SIGTTOU:
            sigName = @"SIGTTOU";
            break;
        case SIGIO:
            sigName = @"SIGIO";
            break;
        case SIGXCPU:
            sigName = @"SIGXCPU";
            break;
        case SIGXFSZ:
            sigName = @"SIGXFSZ";
            break;
        case SIGVTALRM:
            sigName = @"SIGVTALRM";
            break;
        case SIGPROF:
            sigName = @"SIGPROF";
            break;
        case SIGWINCH:
            sigName = @"SIGWINCH";
            break;
        case SIGINFO:
            sigName = @"SIGINFO";
            break;
        case SIGUSR1:
            sigName = @"SIGUSR1";
            break;
        case SIGUSR2:
            sigName = @"SIGUSR2";
            break;
        default:
            break;
    }
    return sigName;
}

+ (NSString *)stringRepresentationOfStatusBarStyle:(UIStatusBarStyle)style {
    NSString *styleString;
    switch (style) {
        case UIStatusBarStyleBlackOpaque:
            styleString = @"UIStatusBarStyleBlackOpaque";
            break;
        case UIStatusBarStyleBlackTranslucent:
            styleString = @"UIStatusBarStyleBlackTranslucent";
            break;
        case UIStatusBarStyleDefault:
            styleString = @"UIStatusBarStyleDefault";
            break;
        default:
            styleString = @"UNKNOWN";
            break;
    }
    return styleString;
}

+ (NSString *)stringRepresentationOfTextWritingDirection:(UITextWritingDirection)writingDirection {
    NSString *writingDirectionString;
    switch (writingDirection) {
        case UITextWritingDirectionLeftToRight:
            writingDirectionString = @"UITextWritingDirectionLeftToRight";
            break;
        case UITextWritingDirectionNatural:
            writingDirectionString = @"UITextWritingDirectionNatural";
            break;
        case UITextWritingDirectionRightToLeft:
            writingDirectionString = @"UITextWritingDirectionRightToLeft";
            break;
        default:
            writingDirectionString = @"UNKNOWN";
            break;
    }
    return writingDirectionString;
}

+ (NSString *)stringRepresentationOfAnimationOptions:(UIViewAnimationOptions)animOpts {
    NSString *animOptsStr = nil;
    switch (animOpts >> 20) {
        case (UIViewAnimationOptionTransitionNone >> 20):
            animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionTransitionNone"] : @"UIViewAnimationOptionTransitionNone");
            break;
        case (UIViewAnimationOptionTransitionFlipFromLeft >> 20):
            animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionTransitionFlipFromLeft"] : @"UIViewAnimationOptionTransitionFlipFromLeft");
            break;
        case (UIViewAnimationOptionTransitionFlipFromRight >> 20):
            animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionTransitionFlipFromRight"] : @"UIViewAnimationOptionTransitionFlipFromRight");
            break;
        case (UIViewAnimationOptionTransitionCurlUp >> 20):
            animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionTransitionCurlUp"] : @"UIViewAnimationOptionTransitionCurlUp");
            break;
        case (UIViewAnimationOptionTransitionCurlDown >> 20):
            animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionTransitionCurlDown"] : @"UIViewAnimationOptionTransitionCurlDown");
            break;
        case (UIViewAnimationOptionTransitionCrossDissolve >> 20):
            animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionTransitionCrossDissolve"] : @"UIViewAnimationOptionTransitionCrossDissolve");
            break;
        case (UIViewAnimationOptionTransitionFlipFromTop >> 20):
            animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionTransitionFlipFromTop"] : @"UIViewAnimationOptionTransitionFlipFromTop");
            break;
        case (UIViewAnimationOptionTransitionFlipFromBottom >> 20):
            animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionTransitionFlipFromBottom"] : @"UIViewAnimationOptionTransitionFlipFromBottom");
            break;
        default:
            break;
    }
    animOpts &= ~(animOpts << 20);
    
    switch (animOpts >> 16) {
        case (UIViewAnimationOptionCurveEaseInOut >> 16):
            animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionCurveEaseInOut"] : @"UIViewAnimationOptionCurveEaseInOut");
            break;
        case (UIViewAnimationOptionCurveEaseIn >> 16):
            animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionCurveEaseIn"] : @"UIViewAnimationOptionCurveEaseIn");
            break;
        case (UIViewAnimationOptionCurveEaseOut >> 16):
            animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionCurveEaseOut"] : @"UIViewAnimationOptionCurveEaseOut");
            break;
        case (UIViewAnimationOptionCurveLinear >> 16):
            animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionCurveLinear"] : @"UIViewAnimationOptionCurveLinear");
            break;
        default:
            break;
    }
    animOpts &= ~(animOpts << 16);
    
    if ((animOpts & UIViewAnimationOptionLayoutSubviews) == UIViewAnimationOptionLayoutSubviews) {
        animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionLayoutSubviews"] : @"UIViewAnimationOptionLayoutSubviews");
    }
    if ((animOpts & UIViewAnimationOptionAllowUserInteraction) == UIViewAnimationOptionAllowUserInteraction) {
        animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionAllowUserInteraction"] : @"UIViewAnimationOptionAllowUserInteraction");
    }
    if ((animOpts & UIViewAnimationOptionBeginFromCurrentState) == UIViewAnimationOptionBeginFromCurrentState) {
        animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionBeginFromCurrentState"] : @"UIViewAnimationOptionBeginFromCurrentState");
    }
    if ((animOpts & UIViewAnimationOptionRepeat) == UIViewAnimationOptionRepeat) {
        animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionRepeat"] : @"UIViewAnimationOptionRepeat");
    }
    if ((animOpts & UIViewAnimationOptionAutoreverse) == UIViewAnimationOptionAutoreverse) {
        animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionAutoreverse"] : @"UIViewAnimationOptionAutoreverse");
    }
    if ((animOpts & UIViewAnimationOptionOverrideInheritedDuration) == UIViewAnimationOptionOverrideInheritedDuration) {
        animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionOverrideInheritedDuration"] : @"UIViewAnimationOptionOverrideInheritedDuration");
    }
    if ((animOpts & UIViewAnimationOptionOverrideInheritedCurve) == UIViewAnimationOptionOverrideInheritedCurve) {
        animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionOverrideInheritedCurve"] : @"UIViewAnimationOptionOverrideInheritedCurve");
    }
    if ((animOpts & UIViewAnimationOptionAllowAnimatedContent) == UIViewAnimationOptionAllowAnimatedContent) {
        animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionAllowAnimatedContent"] : @"UIViewAnimationOptionAllowAnimatedContent");
    }
    if ((animOpts & UIViewAnimationOptionShowHideTransitionViews) == UIViewAnimationOptionShowHideTransitionViews) {
        animOptsStr = (animOptsStr ? [animOptsStr stringByAppendingString:@"|UIViewAnimationOptionShowHideTransitionViews"] : @"UIViewAnimationOptionShowHideTransitionViews");
    }
    return animOptsStr;
}

int signalFromString(NSString *sigName) {
    int sig = -1;
    if ([sigName isEqualToString:@"SIGHUP"]) {
        sig = SIGHUP;
    } else if ([sigName isEqualToString:@"SIGINT"]) {
        sig = SIGINT;
    } else if ([sigName isEqualToString:@"SIGQUIT"]) {
        sig = SIGQUIT;
    } else if ([sigName isEqualToString:@"SIGILL"]) {
        sig = SIGILL;
    } else if ([sigName isEqualToString:@"SIGTRAP"]) {
        sig = SIGTRAP;
    } else if ([sigName isEqualToString:@"SIGABRT"]) {
        sig = SIGABRT;
    } else if ([sigName isEqualToString:@"SIGFPE"]) {
        sig = SIGFPE;
    } else if ([sigName isEqualToString:@"SIGKILL"]) {
        sig = SIGKILL;
    } else if ([sigName isEqualToString:@"SIGBUS"]) {
        sig = SIGBUS;
    } else if ([sigName isEqualToString:@"SIGSEGV"]) {
        sig = SIGSEGV;
    } else if ([sigName isEqualToString:@"SIGSYS"]) {
        sig = SIGSYS;
    } else if ([sigName isEqualToString:@"SIGPIPE"]) {
        sig = SIGPIPE;
    } else if ([sigName isEqualToString:@"SIGALRM"]) {
        sig = SIGALRM;
    } else if ([sigName isEqualToString:@"SIGTERM"]) {
        sig = SIGTERM;
    } else if ([sigName isEqualToString:@"SIGURG"]) {
        sig = SIGURG;
    } else if ([sigName isEqualToString:@"SIGSTOP"]) {
        sig = SIGSTOP;
    } else if ([sigName isEqualToString:@"SIGTSTP"]) {
        sig = SIGTSTP;
    } else if ([sigName isEqualToString:@"SIGCONT"]) {
        sig = SIGCONT;
    } else if ([sigName isEqualToString:@"SIGCHLD"]) {
        sig = SIGCHLD;
    } else if ([sigName isEqualToString:@"SIGTTIN"]) {
        sig = SIGTTIN;
    } else if ([sigName isEqualToString:@"SIGTTOU"]) {
        sig = SIGTTOU;
    } else if ([sigName isEqualToString:@"SIGIO"]) {
        sig = SIGIO;
    } else if ([sigName isEqualToString:@"SIGXCPU"]) {
        sig = SIGXCPU;
    } else if ([sigName isEqualToString:@"SIGXFSZ"]) {
        sig = SIGXFSZ;
    } else if ([sigName isEqualToString:@"SIGVTALRM"]) {
        sig = SIGVTALRM;
    } else if ([sigName isEqualToString:@"SIGPROF"]) {
        sig = SIGPROF;
    } else if ([sigName isEqualToString:@"SIGWINCH"]) {
        sig = SIGWINCH;
    } else if ([sigName isEqualToString:@"SIGINFO"]) {
        sig = SIGINFO;
    } else if ([sigName isEqualToString:@"SIGUSR1"]) {
        sig = SIGUSR1;
    } else if ([sigName isEqualToString:@"SIGUSR2"]) {
        sig = SIGUSR2;
    } else {
        sig = -1;
    }
    return sig;
}

- (BOOL)isSameAsVersion:(NSString *)version {
    return ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] compare:[version stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] options:(NSNumericSearch | NSCaseInsensitiveSearch | NSWidthInsensitiveSearch | NSForcedOrderingSearch)] == NSOrderedSame);
}

- (BOOL)isOlderThanVersion:(NSString *)version {
    return ([self compare:version options:(NSNumericSearch | NSCaseInsensitiveSearch | NSWidthInsensitiveSearch | NSForcedOrderingSearch)] == NSOrderedAscending);
}

- (BOOL)isNewerThanVersion:(NSString *)version {
    return ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] compare:[version stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] options:(NSNumericSearch | NSCaseInsensitiveSearch | NSWidthInsensitiveSearch | NSForcedOrderingSearch)] == NSOrderedDescending);
}

- (BOOL)isEmpty {
    return self.length == 0 ? YES : NO;
}

- (NSInteger)countOccurencesOfString:(NSString*)searchString {
    int strCount = [self length] - [[self stringByReplacingOccurrencesOfString:searchString withString:@""] length];
    return strCount / [searchString length];
}

- (NSArray *)linesForFont:(UIFont *)font width:(CGFloat)width lineBreakMode:(UILineBreakMode)breakMode {
    NSArray *lineParts = nil;
    CGFloat lineHeight = [@"|W|" sizeWithFont:font forWidth:CGFLOAT_MAX lineBreakMode:UILineBreakModeClip].height;
    CGSize constrainSize = CGSizeMake(width, CGFLOAT_MAX);
    if (breakMode == UILineBreakModeWordWrap) {
        NSArray *words = [self componentsSeparatedByString:@" "];
        for (int count = [words count]; count > 0; --count) {
            NSString *testString = [[words objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, count)]] componentsJoinedByString:@" "];
            CGSize size = [testString sizeWithFont:font constrainedToSize:constrainSize lineBreakMode:UILineBreakModeWordWrap];
            if (size.height == lineHeight) {
                lineParts = [NSArray arrayWithObjects:[self stringByReplacingOccurrencesOfString:testString withString:@""], testString, nil];
            }
        }
    } else {
        for (int count = [self length]; count > 0; --count) {
            NSString *testString = [self substringToIndex:count];
            CGSize size = [testString sizeWithFont:font constrainedToSize:constrainSize lineBreakMode:UILineBreakModeCharacterWrap];
            if (size.height == lineHeight) {
                lineParts = [NSArray arrayWithObjects:[self stringByReplacingOccurrencesOfString:testString withString:@""], testString, nil];
            }
        }
    }
    return lineParts;
}

+ (NSString *)hexStringFromColor:(CGColorRef)color {
    const CGFloat *c = CGColorGetComponents(color);
	CGFloat r, g, b;
	r = c[0];
	g = c[1];
	b = c[2];

    // Fix range if needed
	if (r < 0.0f) r = 0.0f;
	if (g < 0.0f) g = 0.0f;
	if (b < 0.0f) b = 0.0f;

	if (r > 1.0f) r = 1.0f;
	if (g > 1.0f) g = 1.0f;
	if (b > 1.0f) b = 1.0f;

    // Convert to hex string between 0x00 and 0xFF
	return [NSString stringWithFormat:@"%02X%02X%02X", (int)(r * 255), (int)(g * 255), (int)(b * 255)];
}

+ (NSString *)stringRepresentationOfPropertyValueNamed:(NSString *)propName ofType:(NSString *)propType forObject:(id)obj {
    id propVal = nil;
    SEL selector = NSSelectorFromString(propName);
    if ([obj respondsToSelector:selector]) {
        propVal = [obj performSelector:selector];
        
        if (propVal <= (id)0x60) {
            
            if ([propName isEqualToString:@"lineBreakMode"]) {
                propVal = [NSString stringRepresentationOfLineBreakMode:(int)propVal];
            } else if ([propName isEqualToString:@"baselineAdjustment"]) {
                propVal = [NSString stringRepresentationOfBaselineAdjustment:(int)propVal];
            } else if ([propName isEqualToString:@"textAlignment"]) {
                propVal = [NSString stringRepresentationOfTextAlignment:(int)propVal];
            } else {
                propVal = [NSString stringWithFormat:@"%d", (int)propVal];
            }
            
        } else if ([propType isEqualToString:@"f"]) {
            
            propVal = [NSString stringWithFormat:@"%@", propVal];
            
        } else {
            
            if ([propName isEqualToString:@"text"]) {
                propVal = [(NSString *)propVal repr];
            } else if ([propName hasSuffix:@"Color"]) {
                propVal = [NSString stringRepresentationOfColor:(UIColor *)propVal];
            } else if ([propName isEqualToString:@"font"]) {
                propVal = [NSString stringRepresentationOfFont:(UIFont *)propVal];
            }
            
        }
    } else {
        propVal = [NSString stringWithFormat:@"Object does not respond to selector: %@", propName];
    }
    return propVal;
}


- (NSString *)stripString:(NSString *)strToStrip {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:strToStrip]];
}

- (NSString *)stripCharSet:(NSCharacterSet *)charSetToStrip {
    return [self stringByTrimmingCharactersInSet:charSetToStrip];
}

- (NSString *)lstripString:(NSString *)strToStrip {
    return [self lstripCharSet:[NSCharacterSet characterSetWithCharactersInString:strToStrip]];
}

- (NSString *)lstripCharSet:(NSCharacterSet *)charSetToStrip {
    NSMutableString *retMutableStr = [[NSMutableString alloc] initWithString:self];
    for (int x = 0, count = self.length; x < count; ++x) {
        if ([charSetToStrip characterIsMember:[self characterAtIndex:x]]) {
            [retMutableStr replaceCharactersInRange:NSMakeRange(0, 1) withString:@""];
        } else {
            break;
        }
    }
    NSString *ret = [NSString stringWithString:retMutableStr];
    [retMutableStr release], retMutableStr = nil;
    return ret;
}

- (NSString *)rstripString:(NSString *)strToStrip {
    return [self rstripCharSet:[NSCharacterSet characterSetWithCharactersInString:strToStrip]];
}

- (NSString *)rstripCharSet:(NSCharacterSet *)charSetToStrip {
    NSMutableString *retMutableStr = [[NSMutableString alloc] initWithString:self];
    for (int x = (self.length - 1); x >= 0; --x) {
        if ([charSetToStrip characterIsMember:[self characterAtIndex:x]]) {
            [retMutableStr replaceCharactersInRange:NSMakeRange(x, 1) withString:@""];
        } else {
            break;
        }
    }
    NSString *ret = [NSString stringWithString:retMutableStr];
    [retMutableStr release], retMutableStr = nil;
    return ret;
}

+ (NSString *)stringFromFileSize:(int)theSize {
	float size = (float)theSize;
	if (size < 1023.0) {
		return([NSString stringWithFormat:@"%f B", size]);
    }
	size /= 1024.0;
	if (size < 1023.0) {
		return([NSString stringWithFormat:@"%1.1f KB", size]);
    }
	size /= 1024.0;
	if (size < 1023.0) {
		return([NSString stringWithFormat:@"%1.1f MB", size]);
    }
	size /= 1024.0;
    if (size < 1023.0) {
		return([NSString stringWithFormat:@"%1.1f GB", size]);
    }
    size /= 1024.0;
	return ([NSString stringWithFormat:@"%1.1f TB", size]);
}

+ (NSString *)humanReadableFileSize:(unsigned long long)fileSize {
    static unsigned long long tb = 1000ULL * 1000ULL * 1000ULL * 1000ULL;
    static unsigned long long gb = 1000ULL * 1000ULL * 1000ULL;
    static unsigned long long mb = 1000ULL * 1000ULL;
    static unsigned long long kb = 1000ULL;
    
    unsigned long long divisor = 0;
    NSString *magnitude = nil;
    
    if (fileSize == 0) {
        return @"0 b";
    } else if (fileSize > tb) {
        divisor = tb;
        magnitude = @"TB";
    } else if (fileSize > gb) {
        divisor = gb;
        magnitude = @"GB";
    } else if (fileSize > mb) {
        divisor = mb;
        magnitude = @"MB";
    } else if (fileSize > kb) {
        divisor = kb;
        magnitude = @"KB";
    } else {
        return [NSString stringWithFormat:@"%llu b", fileSize];
    }
    
    unsigned long long whole = (fileSize / divisor);
    unsigned long long part = (fileSize - (whole * divisor)) / (divisor / 1000);
    unsigned long long tenths = part / 100;
    unsigned long long hundredths = (part - (tenths * 100)) / 10;
    
    NSMutableString *fileSizeStr = [[NSMutableString alloc] init];
    [fileSizeStr appendFormat:@"%llu", whole];
    
    if (tenths) {
        [fileSizeStr appendString:@"."];
        [fileSizeStr appendFormat:@"%llu", tenths];
        
        if (hundredths) {
            [fileSizeStr appendFormat:@"%llu", hundredths];
        }
    } else if (hundredths) {
        [fileSizeStr appendString:@".0"];
        [fileSizeStr appendFormat:@"%llu", hundredths];
    }
    [fileSizeStr appendString:@" "];
    [fileSizeStr appendString:magnitude];
    return [fileSizeStr autorelease];
}

+ (NSString *)stringRepresentationOfPyGILState:(PyGILState_STATE)state {
    NSString *gilStateStr = nil;
    switch (state) {
        case PyGILState_UNLOCKED:
            gilStateStr = @"PyGILState_UNLOCKED";
            break;
        case PyGILState_LOCKED:
            gilStateStr = @"PyGILState_LOCKED";
            break;
        default:
            gilStateStr = @"UNKNOWN";
            break;
    }
    return gilStateStr;
}

- (BOOL)isHex {
    return [[NSScanner scannerWithString:self] scanHexInt:NULL];
}

- (NSRange)rangeValue {
    return NSMakeRange(0, self.length);
}

#pragma mark - ParseKitAdditions
- (NSString *)stringByTrimmingQuotes {
    NSUInteger len = self.length;
    
    if (len < 2) {
        return self;
    }
    
    NSRange r = NSMakeRange(0, len);
    
    unichar c = [self characterAtIndex:0];
    if (!isalnum(c)) {
        unichar quoteChar = c;
        r.location = 1;
        r.length -= 1;
        
        c = [self characterAtIndex:len - 1];
        if (c == quoteChar) {
            r.length -= 1;
        }
        return [self substringWithRange:r];
    } else {
        return self;
    }
}

@end
