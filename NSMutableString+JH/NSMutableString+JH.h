/*
 *  NSMutableString+JH.h
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 11/25/11
 *
 *  Copyright 2011-2012 Jonathan Hosmer
 *  http://pythonforios.com
 */

@interface NSMutableString (JH)

- (unichar)lastCharacter;
- (unichar)firstCharacter;
- (void)deleteAllCharacters;
- (BOOL)isEmpty;
- (NSInteger)countOccurencesOfString:(NSString*)searchString;
- (void)appendPathComponent:(NSString *)pathComponent;
- (void)deleteLastPathComponent;
- (void)replaceLastPathComponent:(NSString *)pathComponent;

@end

