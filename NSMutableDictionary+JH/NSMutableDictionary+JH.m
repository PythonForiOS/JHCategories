/*
 *  NSMutableDictionary+JH.m
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 12/12/11
 *
 *  Copyright (c) 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
#import "NSMutableDictionary+JH.h"
    
@implementation NSMutableDictionary (JH)



- (void)setFloat:(float)value forKey:(NSString *)key {
    [self setObject:[NSNumber numberWithFloat:value] forKey:key];
}

- (float)floatForKey:(NSString *)key {
    float ret = 0.0f;
    NSNumber *num = (NSNumber *)[self objectForKey:key];
    if (num && [num isKindOfClass:[NSNumber class]]) {
        ret = [num floatValue];
    }
    return ret;
}



- (void)setInteger:(NSInteger)value forKey:(NSString *)key {
    [self setObject:[NSNumber numberWithInteger:value] forKey:key];
}

- (NSInteger)integerForKey:(NSString *)key {
    NSInteger ret = 0;
    NSNumber *num = (NSNumber *)[self objectForKey:key];
    if (num && [num isKindOfClass:[NSNumber class]]) {
        ret = [num integerValue];
    }
    return ret;
}



- (void)setInt:(int)value forKey:(NSString *)key {
    [self setObject:[NSNumber numberWithInt:value] forKey:key];
}

- (int)intForKey:(NSString *)key {
    int ret = 0;
    NSNumber *num = (NSNumber *)[self objectForKey:key];
    if (num && [num isKindOfClass:[NSNumber class]]) {
        ret = [num intValue];
    }
    return ret;
}



- (void)setBool:(BOOL)value forKey:(NSString *)key {
    [self setObject:[NSNumber numberWithBool:value] forKey:key];
}

- (BOOL)boolForKey:(NSString *)key {
    BOOL ret = NO;
    NSNumber *num = (NSNumber *)[self objectForKey:key];
    if (num && [num isKindOfClass:[NSNumber class]]) {
        ret = [num boolValue];
    }
    return ret;
}



- (void)setPoint:(CGPoint)value forKey:(NSString *)key {
    [self setObject:[NSValue valueWithCGPoint:value] forKey:key];
}

- (CGPoint)pointForKey:(NSString *)key {
    CGPoint ret = CGPointZero;
    NSValue *val = (NSValue *)[self objectForKey:key];
    if (val && [val isKindOfClass:[NSValue class]]) {
        ret = [val CGPointValue];
    }
    return ret;
}



- (void)setRect:(CGRect)value forKey:(NSString *)key {
    [self setObject:[NSValue valueWithCGRect:value] forKey:key];
}

- (CGRect)rectForKey:(NSString *)key {
    CGRect ret = CGRectZero;
    NSValue *val = (NSValue *)[self objectForKey:key];
    if (val && [val isKindOfClass:[NSValue class]]) {
        ret = [val CGRectValue];
    }
    return ret;
}


- (void)setSize:(CGSize)value forKey:(NSString *)key {
    [self setObject:[NSValue valueWithCGSize:value] forKey:key];
}

- (CGSize)sizeForKey:(NSString *)key {
    CGSize ret = CGSizeZero;
    NSValue *val = (NSValue *)[self objectForKey:key];
    if (val && [val isKindOfClass:[NSValue class]]) {
        ret = [val CGSizeValue];
    }
    return ret;
}


- (void)setanimationCurve:(UIViewAnimationCurve)value forKey:(NSString *)key {
    [self setObject:[NSNumber numberWithInt:value] forKey:key];
}

- (UIViewAnimationCurve)animationCurveForKey:(NSString *)key {
    UIViewAnimationCurve ret = 0;
    NSNumber *val = (NSNumber *)[self objectForKey:key];
    if (val && [val isKindOfClass:[NSNumber class]]) {
        ret = (UIViewAnimationCurve)[val intValue];
    }
    return ret;    
}



- (void)setURL:(NSURL *)value forKey:(NSString *)key {
    [self setObject:value forKey:key];
}

- (NSURL *)urlForKey:(NSString *)key {
    return (NSURL *)[self objectForKey:key];
}



- (void)setNumber:(NSNumber *)value forKey:(NSString *)key {
    [self setObject:value forKey:key];
}

- (NSNumber *)numberForKey:(NSString *)key {
    return (NSNumber *)[self objectForKey:key];
}



- (void)setString:(NSString *)value forKey:(NSString *)key {
    [self setObject:value forKey:key];
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



- (void)setArray:(NSArray *)value forKey:(NSString *)key {
    [self setObject:value forKey:key];
}

- (NSArray *)arrayForKey:(NSString *)key {
    return (NSArray *)[self objectForKey:key];
}


- (void)setColor:(UIColor *)value forKey:(NSString *)key {
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:value];
    if (colorData && [colorData length]) {
        [self setData:colorData forKey:key];
    } else {
        [self setObject:[NSNull null] forKey:key];
    }
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


- (void)setFont:(UIFont *)value forKey:(NSString *)key {
    NSData *fontData = [NSKeyedArchiver archivedDataWithRootObject:value];
    if (fontData && [fontData length]) {
        [self setData:fontData forKey:key];
    } else {
        [self setObject:[NSNull null] forKey:key];
    }
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


- (void)setDictionary:(NSDictionary *)value forKey:(NSString *)key {
    [self setObject:value forKey:key];
}

- (NSDictionary *)dictionaryForKey:(NSString *)key {
    return (NSDictionary *)[self objectForKey:key];
}


- (void)setSet:(NSSet *)value forKey:(NSString *)key {
    [self setObject:value forKey:key];
}

- (NSSet *)setForKey:(NSString *)key {
    return (NSSet *)[self objectForKey:key];
}


- (void)setDate:(NSDate *)value forKey:(NSString *)key {
    [self setObject:value forKey:key];
}

- (NSDate *)dateForKey:(NSString *)key {
    return (NSDate *)[self objectForKey:key];
}


- (void)setData:(NSData *)value forKey:(NSString *)key {
    [self setObject:value forKey:key];
}

- (NSData *)dataForKey:(NSString *)key {
    return (NSData *)[self objectForKey:key];
}

- (void)setIndexPath:(NSIndexPath *)value forKey:(NSString *)key {
    [self setObject:value forKey:key];
}

- (NSIndexPath *)indexPathForKey:(NSString *)key {
    return (NSIndexPath *)[self objectForKey:key];
}

@end

