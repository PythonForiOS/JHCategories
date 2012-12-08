/*
 *  NSMutableString+JH.m
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 11/25/11
 *
 *  Copyright 2011-2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
#import "NSMutableString+JH.h"

@implementation NSMutableString (JH)

- (unichar)lastCharacter {
    unichar retChar;
    if (self.length) {
        retChar = [self characterAtIndex:self.length - 1];
    } else {
        retChar = '\0';
    }
    return retChar;
}

- (unichar)firstCharacter {
    unichar retChar;
    if (self.length) {
        retChar = [self characterAtIndex:0];
    } else {
        retChar = '\0';
    }
    return retChar;
}

- (void)deleteAllCharacters {
    [self deleteCharactersInRange:NSMakeRange(0, [self length])];
}

- (BOOL)isEmpty {
    return ([self length] == 0 ? YES : NO);
}

- (NSInteger)countOccurencesOfString:(NSString*)searchString {
    int strCount = [self length] - [[self stringByReplacingOccurrencesOfString:searchString withString:@""] length];
    return strCount / [searchString length];
}

- (void)appendPathComponent:(NSString *)pathComponent {
    [self setString:[self stringByAppendingPathComponent:pathComponent]];
}

- (void)deleteLastPathComponent {
    [self setString:[self stringByDeletingLastPathComponent]];
}

- (void)replaceLastPathComponent:(NSString *)pathComponent {
    [self deleteLastPathComponent];
    [self appendPathComponent:pathComponent];
}

@end

