/*
 *  NSDictionary+JH.h
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 12/12/11
 *
 *  Copyright (c) 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
@interface NSDictionary (JH)

- (CGFloat)floatForKey:(NSString *)key;
- (NSInteger)integerForKey:(NSString *)key;
- (int)intForKey:(NSString *)key;
- (BOOL)boolForKey:(NSString *)key;
- (CGPoint)pointForKey:(NSString *)key;
- (CGRect)rectForKey:(NSString *)key;
- (CGSize)sizeForKey:(NSString *)key;
- (UIViewAnimationCurve)animationCurveForKey:(NSString *)key;
- (UIColor *)colorForKey:(NSString *)key;
- (UIFont *)fontForKey:(NSString *)key;
- (NSURL *)urlForKey:(NSString *)key;
- (NSNumber *)numberForKey:(NSString *)key;
- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultValue;
- (NSString *)stringForKey:(NSString *)key;
- (NSArray *)arrayForKey:(NSString *)key;
- (NSDictionary *)dictionaryForKey:(NSString *)key;
- (NSSet *)setForKey:(NSString *)key;
- (NSDate *)dateForKey:(NSString *)key;
- (NSData *)dataForKey:(NSString *)key;
- (NSIndexPath *)indexPathForKey:(NSString *)key;

@end
