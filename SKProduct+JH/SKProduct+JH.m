/*
 *  SKProduct+JH.m
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 2/8/12
 *
 *  Copyright 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
#import "SKProduct+JH.h"
    
@implementation SKProduct (JH)

- (NSString *)localizedPrice {
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
    [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [numberFormatter setLocale:self.priceLocale];
    NSString *formattedString = [numberFormatter stringFromNumber:self.price];
    [numberFormatter release];
    return formattedString;
}

@end

