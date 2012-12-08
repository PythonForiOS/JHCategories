/*
 *  SKProduct+JH.h
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 2/8/12
 *
 *  Copyright 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
#import <StoreKit/StoreKit.h>

@interface SKProduct (JH)

@property (nonatomic, readonly) NSString *localizedPrice;

@end

