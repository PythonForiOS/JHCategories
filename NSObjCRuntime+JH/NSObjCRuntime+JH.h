/*
 *  NSObjCRuntime+JH.h
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 9/4/11
 *
 *  Copyright 2011-2012 Jonathan Hosmer
 *  http://pythonforios.com
 */

#import "objc/runtime.h"
#import "TestFlight.h"

#if defined(DEBUG) && !defined(WEB_INSTALL)
    extern void DBGQuietLog( NSString *__FORMAT__, ... ) NS_FORMAT_FUNCTION(1,2);
#    define DEBUGQUIETLOG(__FORMAT__, ...) DBGQuietLog(__FORMAT__, ##__VA_ARGS__);
#    define DEBUGLOG(__FORMAT__, ...)      DEBUGQUIETLOG((@"%s [Line: %d] " __FORMAT__), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#    define DEBUGLOG_ERROR(error)          DEBUGLOG(@"ERROR: <%@ - %@ - %@ - %@>", [error localizedDescription], [error localizedFailureReason], [error localizedRecoveryOptions], [error localizedRecoverySuggestion]); error = nil;
#else
    extern void DBGQuietLog( void );
#    define DEBUGQUIETLOG(__FORMAT__, ...) do{}while(0);
#    define DEBUGLOG(__FORMAT__, ...)      do{}while(0);
#    define DEBUGLOG_ERROR(error)          do{}while(0);
#endif

#ifndef LocationLog
#   define LocationLog(format,...) { \
               NSString *file = [[NSString stringWithUTF8String:__FILE__] lastPathComponent]; \
               printf("%s:%d - ", [file UTF8String], __LINE__); \
               QuietLog((format),##__VA_ARGS__); \
           }
#endif

extern const char *getPropertyType( objc_property_t );
extern NSString *documentsDirectory( void );
extern NSString *resourceDirectory( void );
extern NSString *libraryDirectory( void );
extern NSString *cachesDirectory( void );

extern CGFloat getSpace( BOOL );
extern CGFloat getFreeDiskspace( void );
extern CGFloat getTotalDiskspace( void );
extern int roundd ( int );

extern NSArray *callStack( void );

extern NSFileManager *defaultFileManager( void );

extern BOOL NSRangeEqualToRange(NSRange r1, NSRange r2);

void runBlockOnMainQueueSync(void(^block)(void));

