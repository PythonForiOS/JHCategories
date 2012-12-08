/*
 *  NSUserDefaults+JH.h
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 10/1/11
 *
 *  Copyright 2011-2012 Jonathan Hosmer
 *  http://pythonforios.com
 */

@interface NSUserDefaults (JH)

+ (id)objectForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsFont:(UIFont *)font forKey:(NSString *)defaultName;
+ (UIFont *)fontForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsColor:(UIColor *)color forKey:(NSString *)defaultName;
+ (UIColor *)colorForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsURL:(NSURL *)url forKey:(NSString *)defaultName;
+ (NSURL *)urlForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsString:(NSString *)string forKey:(NSString *)defaultName;
+ (NSString *)stringForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsArray:(NSArray *)array forKey:(NSString *)defaultName;
+ (NSArray *)arrayForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsDictionary:(NSDictionary *)dictionary forKey:(NSString *)defaultName;
+ (NSDictionary *)dictionaryForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsData:(NSData *)data forKey:(NSString *)defaultName;
+ (NSData *)dataForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsDate:(NSDate *)date forKey:(NSString *)defaultName;
+ (NSDate *)dateForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsInt:(NSInteger)i forKey:(NSString *)defaultName;
+ (NSInteger)intForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsFloat:(CGFloat)f forKey:(NSString *)defaultName;
+ (CGFloat)floatForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsDouble:(double)d forKey:(NSString *)defaultName;
+ (double)doubleForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsBool:(BOOL)value forKey:(NSString *)defaultName;
+ (BOOL)boolForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsPoint:(CGPoint)point forKey:(NSString *)defaultName;
+ (CGPoint)pointForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsRect:(CGRect)rect forKey:(NSString *)defaultName;
+ (CGRect)rectForStandardUserDefaultsKey:(NSString *)defaultName;

+ (void)setStandardUserDefaultsObject:(id)value forKey:(NSString *)defaultName;
+ (void)removeStandardUserDefaultsObjectForKey:(NSString *)defaultName;

+ (void)printAllStandardUserDefaultsObjects;

@end
