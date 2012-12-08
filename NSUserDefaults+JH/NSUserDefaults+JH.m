/*
 *  NSUserDefaults+JH.m
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 10/1/11
 *
 *  Copyright 2011-2012 Jonathan Hosmer
 *  http://pythonforios.com
 */

#import "NSUserDefaults+JH.h"

@implementation NSUserDefaults (JH)

+ (id)objectForStandardUserDefaultsKey:(NSString *)defaultName {
    return [[self standardUserDefaults] objectForKey:defaultName];
}


+ (void)setStandardUserDefaultsFont:(UIFont *)font forKey:(NSString *)defaultName {
    NSData *fontData = [NSKeyedArchiver archivedDataWithRootObject:font];
    if (fontData) {
        [self setStandardUserDefaultsData:fontData forKey:defaultName];
    }
}

+ (UIFont *)fontForStandardUserDefaultsKey:(NSString *)defaultName {
    UIFont *font = nil;
    NSData *fontData = nil;
    fontData = [[self standardUserDefaults] dataForKey:defaultName];
    if (fontData) {
        font = [NSKeyedUnarchiver unarchiveObjectWithData:fontData];
    }
    return font;
}


+ (void)setStandardUserDefaultsColor:(UIColor *)color forKey:(NSString *)defaultName {
    NSData *colorData = [NSKeyedArchiver archivedDataWithRootObject:color];
    if (colorData) {
        [self setStandardUserDefaultsData:colorData forKey:defaultName];
    }
}

+ (UIColor *)colorForStandardUserDefaultsKey:(NSString *)defaultName {
    UIColor *color = nil;
    NSData *colorData = nil;
    colorData = [[self standardUserDefaults] dataForKey:defaultName];
    if (colorData) {
        color = [NSKeyedUnarchiver unarchiveObjectWithData:colorData];
    }
    return color;
}


+ (void)setStandardUserDefaultsURL:(NSURL *)url forKey:(NSString *)defaultName {
    [[self standardUserDefaults] setURL:url forKey:defaultName];
    [[self standardUserDefaults] synchronize];
}

+ (NSURL *)urlForStandardUserDefaultsKey:(NSString *)defaultName {
    return (NSURL *)[[self standardUserDefaults] objectForKey:defaultName];
}


+ (void)setStandardUserDefaultsString:(NSString *)string forKey:(NSString *)defaultName {
    [self setStandardUserDefaultsObject:string forKey:defaultName];
}

+ (NSString *)stringForStandardUserDefaultsKey:(NSString *)defaultName {
	return [[self standardUserDefaults] stringForKey:defaultName];
}


+ (void)setStandardUserDefaultsArray:(NSArray *)array forKey:(NSString *)defaultName {
    [self setStandardUserDefaultsObject:array forKey:defaultName];
}

+ (NSArray *)arrayForStandardUserDefaultsKey:(NSString *)defaultName {
	return [[self standardUserDefaults] arrayForKey:defaultName];
}

+ (void)setStandardUserDefaultsDictionary:(NSDictionary *)dictionary forKey:(NSString *)defaultName {
    [self setStandardUserDefaultsObject:dictionary forKey:defaultName];
}

+ (NSDictionary *)dictionaryForStandardUserDefaultsKey:(NSString *)defaultName {
	return [[self standardUserDefaults] dictionaryForKey:defaultName];
}


+ (void)setStandardUserDefaultsData:(NSData *)data forKey:(NSString *)defaultName {
    [self setStandardUserDefaultsObject:data forKey:defaultName];
}

+ (NSData *)dataForStandardUserDefaultsKey:(NSString *)defaultName {
	return [[self standardUserDefaults] dataForKey:defaultName];
}


+ (void)setStandardUserDefaultsDate:(NSDate *)date forKey:(NSString *)defaultName {
    [self setStandardUserDefaultsObject:date forKey:defaultName];
}

+ (NSDate *)dateForStandardUserDefaultsKey:(NSString *)defaultName {
    return (NSDate *)[[self standardUserDefaults] objectForKey:defaultName];
}


+ (void)setStandardUserDefaultsInt:(NSInteger)i forKey:(NSString *)defaultName {
    [[self standardUserDefaults] setInteger:i forKey:defaultName];
    [[self standardUserDefaults] synchronize];
}

+ (NSInteger)intForStandardUserDefaultsKey:(NSString *)defaultName {
	return [[self standardUserDefaults] integerForKey:defaultName];
}


+ (void)setStandardUserDefaultsFloat:(CGFloat)f forKey:(NSString *)defaultName {
    [[self standardUserDefaults] setFloat:f forKey:defaultName];
    [[self standardUserDefaults] synchronize];
}

+ (CGFloat)floatForStandardUserDefaultsKey:(NSString *)defaultName {
	return [[self standardUserDefaults] floatForKey:defaultName];
}


+ (void)setStandardUserDefaultsDouble:(double)d forKey:(NSString *)defaultName {
    [[self standardUserDefaults] setDouble:d forKey:defaultName];
    [[self standardUserDefaults] synchronize];
}

+ (double)doubleForStandardUserDefaultsKey:(NSString *)defaultName {
	return [[self standardUserDefaults] doubleForKey:defaultName];
}


+ (void)setStandardUserDefaultsBool:(BOOL)value forKey:(NSString *)defaultName {
    [[self standardUserDefaults] setBool:value forKey:defaultName];
    [[self standardUserDefaults] synchronize];
}

+ (BOOL)boolForStandardUserDefaultsKey:(NSString *)defaultName {
	return [[self standardUserDefaults] boolForKey:defaultName];
}


+ (void)setStandardUserDefaultsPoint:(CGPoint)point forKey:(NSString *)defaultName {
    [[self standardUserDefaults] setObject:NSStringFromCGPoint(point) forKey:defaultName];
    [[self standardUserDefaults] synchronize];
}

+ (CGPoint)pointForStandardUserDefaultsKey:(NSString *)defaultName {
   return CGPointFromString([[self standardUserDefaults] stringForKey:defaultName]);
}


+ (void)setStandardUserDefaultsRect:(CGRect)rect forKey:(NSString *)defaultName {
    [[self standardUserDefaults] setObject:NSStringFromCGRect(rect) forKey:defaultName];
    [[self standardUserDefaults] synchronize];
}

+ (CGRect)rectForStandardUserDefaultsKey:(NSString *)defaultName {
    return CGRectFromString([[self standardUserDefaults] stringForKey:defaultName]);
}


+ (void)setStandardUserDefaultsObject:(id)value forKey:(NSString *)defaultName {
    [[self standardUserDefaults] setObject:value forKey:defaultName];
    [[self standardUserDefaults] synchronize];
}

+ (void)removeStandardUserDefaultsObjectForKey:(NSString *)defaultName {
    [[self standardUserDefaults] removeObjectForKey:defaultName];
    [[self standardUserDefaults] synchronize];
}


+ (void)printAllStandardUserDefaultsObjects {
    DEBUGLOG(@"Standard User Defaults:\n%@", [[[NSUserDefaults standardUserDefaults] dictionaryRepresentation] description]);
}

@end
