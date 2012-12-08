//
//  UIView-Extended.m
//  JH_Categories
//
//  Author: Jonathan Hosmer
//  Date: 8/26/11
//
//  Copyright 2011 Jonathan Hosmer
//  http://pythonforios.com
//

#import "UIView+JH.h"

@implementation UIView (JH)

- (UIView *)findFirstResponder {
	if ([self isFirstResponder]) {
		return self;
	}
	for (UIView *subview in [self subviews]) {
		UIView *firstResponder = [subview findFirstResponder];
		if (firstResponder) {
			return firstResponder;
		}
	}
	return nil;
}

- (UIView *)setFirstResponder:(NSInteger)viewTag {
	if (self.tag == viewTag) {
        [self becomeFirstResponder];
        return self;
    }

	for (UIView *subview in self.subviews) {
		UIView *v = [subview setFirstResponder:viewTag];
		if (v) {
			return v;
        }
	}
	return nil;
}

//- (NSString *)listColor:(UIColor *)color {
//	int r = 0, g = 0, b = 0;
//	CGFloat alpha = 1.0;
//	CGFloat *colors;
//	if (color) {
//		colors = (CGFloat *)CGColorGetComponents(color.CGColor);
//		if (colors) {
//			r = (int)(255 * colors[0]);
//			g = (int)(255 * colors[1]);
//			b = (int)(255 * colors[2]);
//			alpha = colors[3];
//		}
//	}
//    return [NSString stringWithFormat:@"r:%d g:%d b:%d a:%.2f", r, g, b, alpha];
//}
//
//- (NSString *)descriptionTextForView:(UIView *)v indent:(NSInteger)level {
//    NSString *padStr = [NSString stringWithFormat:@"+%@ ", [@"" stringByPaddingToLength:level withString:@"+" startingAtIndex:0]];
//    NSMutableString *str = [[NSMutableString alloc] initWithCapacity:0];
//	if (v) {
//		[str appendFormat:@"%@%s\n", padStr, object_getClassName(v)];
//        if ([v respondsToSelector:@selector(text)]) {
//            [str appendFormat:@"%@Text           : %@\n", padStr, [(NSString *)[v performSelector:@selector(text)] repr]];
//        }
//        [str appendFormat:@"%@%@\n", padStr, [NSString stringWithFormat:@"Bounds         : %@", [NSString stringRepresentationOfRect:v.bounds]]];
//        [str appendFormat:@"%@%@\n", padStr, [NSString stringWithFormat:@"Frame          : %@", [NSString stringRepresentationOfRect:v.frame]]];
//        [str appendFormat:@"%@%@\n", padStr, [NSString stringWithFormat:@"Center         : %@", [NSString stringRepresentationOfPoint:v.center]]];
//
//        id valForKey = nil;
//        if ([[v class] instancesRespondToSelector:@selector(contentSize)]) {
//            valForKey = [v valueForKey:@"contentSize"];
//            if (valForKey) {
//                [str appendFormat:@"%@Content Size   : %@\n", padStr, [NSString stringRepresentationOfSize:[valForKey CGSizeValue]]];
//                valForKey = nil;
//            }
//        }
//        if ([[v class] instancesRespondToSelector:@selector(contentMode)]) {
//            valForKey = [v valueForKey:@"contentMode"];
//            if (valForKey) {
//                [str appendFormat:@"%@Content Mode   : %@\n", padStr, [NSString stringRepresentationOfContentMode:(UIViewContentMode)[valForKey integerValue]]];
//                valForKey = nil;
//            }
//        }
//        if ([[v class] instancesRespondToSelector:@selector(contentInset)]) {
//            valForKey = [v valueForKey:@"contentInset"];
//            if (valForKey) {
//                [str appendFormat:@"%@Content Inset  : %@\n", padStr, [NSString stringRepresentationOfEdgeInsets:[valForKey UIEdgeInsetsValue]]];
//                valForKey = nil;
//            }
//        }
//        if ([[v class] instancesRespondToSelector:@selector(contentOffset)]) {
//            valForKey = [v valueForKey:@"contentOffset"];
//            if (valForKey) {
//                [str appendFormat:@"%@Content Offset : %@\n", padStr, [NSString stringRepresentationOfPoint:[valForKey CGPointValue]]];
//                valForKey = nil;
//            }
//        }
//	}
//    [str appendString:@"\n"];
//    return [str autorelease];
//}
//
//
//
//- (NSString *)describeView:(UIView *)view indent:(NSInteger)level {
//    NSMutableString *result = [[NSMutableString alloc] initWithCapacity:0];
//    [result appendFormat:@"\n%@", [self descriptionTextForView:view indent:level]];
//	for (UIView *subview in view.subviews) {
//        [result appendString:[self describeView:subview indent:level + 1]];
//	}
//	return [result autorelease];
//}
//
//- (NSString *)description {
//    return [self describeView:self indent:0];
//}

- (void)printDescription {
    DEBUGLOG(@"%@", [self description]);
}

- (void)dismissKeyboard_NONPRIVATEAPIMETHOD:(id)sender {
	[[self findFirstResponder] resignFirstResponder];
}

- (void)nextPrevious:(id)sender {
    UIView *responder = [self findFirstResponder];
    if (!responder) return;
    NSInteger newTag;
    NSInteger tagMod = 1;
    if (sender) {
        tagMod = (((UISegmentedControl *)sender).selectedSegmentIndex ? 1 : -1);
    }
	UIView *v = [self viewWithTag:responder.tag + tagMod];
    if ([v isKindOfClass:[UITextField class]] || [v isKindOfClass:[UITextView class]]) {
        newTag = responder.tag + tagMod;
        [self setFirstResponder:newTag];
    } else {
        // Do something....
    }
}


- (void)printPropValDict {
    NSMutableDictionary *propDict = [[NSMutableDictionary alloc] initWithCapacity:0];
    Class myClass = [self class];
    [propDict addEntriesFromDictionary:[NSObject classPropsForClass:myClass recurseUpToSuperclass:[UIView class]]];
    
    DEBUGLOG(@"frame: %@", [NSString stringRepresentationOfRect:self.frame]);
    DEBUGLOG(@"bounds: %@", [NSString stringRepresentationOfRect:self.bounds]);
    DEBUGLOG(@"center: %@", [NSString stringRepresentationOfPoint:self.center]);
    DEBUGLOG(@"multipleTouchEnabled: %@", [NSString stringRepresentationOfBool:self.multipleTouchEnabled]);
    DEBUGLOG(@"exclusiveTouch: %@", [NSString stringRepresentationOfBool:self.exclusiveTouch]);
    DEBUGLOG(@"autoresizesSubviews: %@", [NSString stringRepresentationOfBool:self.autoresizesSubviews]);
    DEBUGLOG(@"autoresizingMask: %@", [NSString stringRepresentationOfAutoResizing:self.autoresizingMask]);
    DEBUGLOG(@"clipsToBounds: %@", [NSString stringRepresentationOfBool:self.clipsToBounds]);
    DEBUGLOG(@"backgroundColor: %@", [NSString stringRepresentationOfColor:self.backgroundColor]);
    DEBUGLOG(@"alpha: %f", self.alpha);
    DEBUGLOG(@"opaque: %@", [NSString stringRepresentationOfBool:self.opaque]);
    DEBUGLOG(@"clearsContextBeforeDrawing: %@", [NSString stringRepresentationOfBool:self.clearsContextBeforeDrawing]);
    DEBUGLOG(@"hidden: %@", [NSString stringRepresentationOfBool:self.hidden]);
    DEBUGLOG(@"contentMode: %@", [NSString stringRepresentationOfContentMode:self.contentMode]);
    
    for (NSString *propName in propDict) {
        DEBUGLOG(@"%@: %@", propName, [NSString stringRepresentationOfPropertyValueNamed:propName ofType:[propDict stringForKey:propName] forObject:self]);
    }
    [propDict release], propDict = nil;
}

NSString *propertiesForSubviewsOfView(UIView *subview, int indent);


- (NSString *)subviewProperties {
    NSMutableString *props = [NSMutableString stringWithCapacity:0];
    [props appendFormat:@"\n%@", propertiesForSubviewsOfView(self, 0)];
    return props;
}

NSString *propertiesForSubviewsOfView(UIView *subview, int indent) {
    NSMutableString *props = [NSMutableString stringWithCapacity:0];
    NSMutableString *indentStr = [NSMutableString stringWithCapacity:indent];
    for (int i = 0; i < indent; ++i)
        [indentStr appendString:@" "];
    
    [props appendString:[indentStr stringByAppendingString:[[subview allProperties] stringByReplacingOccurrencesOfString:@"\n" withString:[NSString stringWithFormat:@"\n%@", indentStr]]]];
    [indentStr appendString:@"  "];
    for (UIView *v in subview.subviews) {
        
        [props appendString:[indentStr stringByAppendingString:[[v allProperties] stringByReplacingOccurrencesOfString:@"\n" withString:[NSString stringWithFormat:@"\n%@", indentStr]]]];
        
        if (v.subviews.count)
           [props appendString:propertiesForSubviewsOfView(v, indent + 4)];

        [props appendString:@"\n"];
        
    }
    return props;
}

@end
