/*
 *  NSObject+JH.h
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 2/4/12
 *
 *  Copyright 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
#import <Foundation/Foundation.h>
    
@interface NSObject (JH)

+ (NSDictionary *)classPropsForClass:(Class)theClass;
+ (NSDictionary *)classPropsForClass:(Class)theClass recurseUpToSuperclass:(Class)superclassStop;
+ (BOOL)swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_;
+ (BOOL)swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_;
- (void)printDescription;
- (NSString *)allProperties;

@end
