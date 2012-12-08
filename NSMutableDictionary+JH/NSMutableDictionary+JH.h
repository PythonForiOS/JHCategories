/*
 *  NSMutableDictionary+JH.h
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 12/12/11
 *
 *  Copyright (c) 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
#import <Foundation/Foundation.h>
    
@interface NSMutableDictionary (JH) 

- (void)setFloat:(float)value forKey:(NSString *)key;
- (float)floatForKey:(NSString *)key;

- (void)setInteger:(NSInteger)value forKey:(NSString *)key;
- (NSInteger)integerForKey:(NSString *)key;

- (void)setInt:(int)value forKey:(NSString *)key;
- (int)intForKey:(NSString *)key;

- (void)setBool:(BOOL)value forKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;

- (void)setPoint:(CGPoint)value forKey:(NSString *)key;
- (CGPoint)pointForKey:(NSString *)key;

- (void)setRect:(CGRect)value forKey:(NSString *)key;
- (CGRect)rectForKey:(NSString *)key;

- (void)setSize:(CGSize)value forKey:(NSString *)key;
- (CGSize)sizeForKey:(NSString *)key;

- (void)setanimationCurve:(UIViewAnimationCurve)value forKey:(NSString *)key;
- (UIViewAnimationCurve)animationCurveForKey:(NSString *)key;

- (void)setURL:(NSURL *)value forKey:(NSString *)key;
- (NSURL *)urlForKey:(NSString *)key;

- (void)setNumber:(NSNumber *)value forKey:(NSString *)key;
- (NSNumber *)numberForKey:(NSString *)key;

- (void)setString:(NSString *)value forKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultValue;
- (NSString *)stringForKey:(NSString *)key;

- (void)setArray:(NSArray *)value forKey:(NSString *)key;
- (NSArray *)arrayForKey:(NSString *)key;

- (void)setColor:(UIColor *)value forKey:(NSString *)key;
- (UIColor *)colorForKey:(NSString *)key;

- (void)setFont:(UIFont *)value forKey:(NSString *)key;
- (UIFont *)fontForKey:(NSString *)key;

- (void)setDictionary:(NSDictionary *)value forKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;

- (void)setSet:(NSSet *)value forKey:(NSString *)key;
- (NSSet *)setForKey:(NSString *)key;

- (void)setDate:(NSDate *)value forKey:(NSString *)key;
- (NSDate *)dateForKey:(NSString *)key;

- (void)setData:(NSData *)value forKey:(NSString *)key;
- (NSData *)dataForKey:(NSString *)key;

- (NSIndexPath *)indexPathForKey:(NSString *)key;
- (void)setIndexPath:(NSIndexPath *)value forKey:(NSString *)key;

@end

