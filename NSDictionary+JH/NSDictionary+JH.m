/*
 *  NSDictionary+JH.m
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 12/12/11
 *
 *  Copyright (c) 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
#import "NSDictionary+JH.h"
    
@implementation NSDictionary (JH)

- (CGFloat)floatForKey:(NSString *)key {
    CGFloat ret = 0.0f;
    NSNumber *num = (NSNumber *)[self objectForKey:key];
    if (num && [num isKindOfClass:[NSNumber class]]) {
        ret = [num floatValue];
    }
    return ret;
}

- (NSInteger)integerForKey:(NSString *)key {
    NSInteger ret = 0;
    NSNumber *num = (NSNumber *)[self objectForKey:key];
    if (num && [num isKindOfClass:[NSNumber class]]) {
        ret = [num integerValue];
    }
    return ret;
}

- (int)intForKey:(NSString *)key {
    int ret = 0;
    NSNumber *num = (NSNumber *)[self objectForKey:key];
    if (num && [num isKindOfClass:[NSNumber class]]) {
        ret = [num intValue];
    }
    return ret;
}

- (BOOL)boolForKey:(NSString *)key {
    BOOL ret = NO;
    NSNumber *num = (NSNumber *)[self objectForKey:key];
    if (num && [num isKindOfClass:[NSNumber class]]) {
        ret = [num boolValue];
    }
    return ret;
}

- (CGPoint)pointForKey:(NSString *)key {
    CGPoint ret = CGPointZero;
    NSValue *val = (NSValue *)[self objectForKey:key];
    if (val && [val isKindOfClass:[NSValue class]]) {
        ret = [val CGPointValue];
    }
    return ret;
}

- (CGRect)rectForKey:(NSString *)key {
    CGRect ret = CGRectZero;
    NSValue *val = (NSValue *)[self objectForKey:key];
    if (val && [val isKindOfClass:[NSValue class]]) {
        ret = [val CGRectValue];
    }
    return ret;
}

- (CGSize)sizeForKey:(NSString *)key {
    CGSize ret = CGSizeZero;
    NSValue *val = (NSValue *)[self objectForKey:key];
    if (val && [val isKindOfClass:[NSValue class]]) {
        ret = [val CGSizeValue];
    }
    return ret;
}

- (UIViewAnimationCurve)animationCurveForKey:(NSString *)key {
    UIViewAnimationCurve ret = 0;
    NSNumber *val = (NSNumber *)[self objectForKey:key];
    if (val && [val isKindOfClass:[NSNumber class]]) {
        ret = (UIViewAnimationCurve)[val intValue];
    }
    return ret;    
}

- (UIColor *)colorForKey:(NSString *)key {
    UIColor *color = nil;
    NSData *colorData = nil;
    colorData = [self dataForKey:key];
    if (colorData && ![colorData isKindOfClass:[NSNull class]] && [colorData length]) {
        color = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    }
    return color;
}

- (UIFont *)fontForKey:(NSString *)key {
    UIFont *font = nil;
    NSData *fontData = nil;
    fontData = [self dataForKey:key];
    if (fontData && ![fontData isKindOfClass:[NSNull class]] && [fontData length]) {
        font = [NSKeyedUnarchiver unarchiveObjectWithData:fontData];
    }
    return font;
}

- (NSURL *)urlForKey:(NSString *)key {
    return (NSURL *)[self objectForKey:key];
}

- (NSNumber *)numberForKey:(NSString *)key {
    return (NSNumber *)[self objectForKey:key];
}

- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultValue {
    id object = [self objectForKey:key];
    if (![object isKindOfClass:[NSString class]])
        return defaultValue;
    return object;
}

- (NSString *)stringForKey:(NSString *)key {
    return (NSString *)[self objectForKey:key];
}

- (NSArray *)arrayForKey:(NSString *)key {
    return (NSArray *)[self objectForKey:key];
}

- (NSDictionary *)dictionaryForKey:(NSString *)key {
    return (NSDictionary *)[self objectForKey:key];
}

- (NSSet *)setForKey:(NSString *)key {
    return (NSSet *)[self objectForKey:key];
}

- (NSDate *)dateForKey:(NSString *)key {
    return (NSDate *)[self objectForKey:key];
}

- (NSData *)dataForKey:(NSString *)key {
    return (NSData *)[self objectForKey:key];
}

- (NSIndexPath *)indexPathForKey:(NSString *)key {
    return (NSIndexPath *)[self objectForKey:key];
}

@end
