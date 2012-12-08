//
/*
 *  NSObjCRuntime+JH.m
 *  JH_Categories
 *
 *  Author: Jonathan Hosmer
 *  Date: 9/4/11
 *
 *  Copyright 2011-2012 Jonathan Hosmer
 *  http://pythonforios.com
 */

#import "NSObjCRuntime+JH.h"
#include <execinfo.h>

#if defined(DEBUG) && !defined(WEB_INSTALL)
    void DBGQuietLog(NSString *__FORMAT__, ...) {
        if (!__FORMAT__) {
            puts("\n");
        } else {
            va_list argList;
            va_start(argList, __FORMAT__);
            NSString *s = [[NSString alloc] initWithFormat:__FORMAT__ arguments:argList];
            printf("%s\n", [[s stringByReplacingOccurrencesOfString:@"%%" withString:@"%%%%"] UTF8String]);
            [s release];
            va_end(argList);
        }
    }
#else
    void DBGQuietLog(void) { }
#endif

const char * getPropertyType(objc_property_t property) {
    const char *attributes = property_getAttributes(property);
//    printf("attributes=%s\n", attributes);
    char buffer[1 + strlen(attributes)];
    strcpy(buffer, attributes);
    char *state = buffer, *attribute;
    while ((attribute = strsep(&state, ",")) != NULL) {
        if (attribute[0] == 'T' && attribute[1] != '@') {
            // it's a C primitive type:
            /* 
             if you want a list of what will be returned for these primitives, search online for
             "objective-c" "Property Attribute Description Examples"
             apple docs list plenty of examples of what you get for int "i", long "l", unsigned "I", struct, etc.            
             */
            return (const char *)[[NSData dataWithBytes:(attribute + 1) length:strlen(attribute) - 1] bytes];
        }        
        else if (attribute[0] == 'T' && attribute[1] == '@' && strlen(attribute) == 2) {
            // it's an ObjC id type:
            return "id";
        }
        else if (attribute[0] == 'T' && attribute[1] == '@') {
            // it's another ObjC object type:
            return (const char *)[[NSData dataWithBytes:(attribute + 3) length:strlen(attribute) - 4] bytes];
        }
    }
    return "";
}

NSString *documentsDirectory(void) {
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
}

NSString *resourceDirectory(void) {
    return [[NSBundle mainBundle] resourcePath];
}

NSString *libraryDirectory(void) {
    return [NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject];
}

NSString *cachesDirectory(void) {
    return [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
}

CGFloat getSpace(BOOL freeSpace) {
    CGFloat retSpace = 0.0f;
    NSError *error = nil;
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:documentsDirectory() error:&error];
    if (!dictionary) {
        DEBUGLOG(@"Unable to get attributes of file system for path '%@'!", documentsDirectory());
        if (error) {
            DEBUGLOG(@"Error Obtaining System Memory Info: Domain = %@, Code = %d, Error = %@", [error domain], (int)[error code], [error localizedDescription]);
            error = nil;
        }
    } else {
        if (freeSpace) {
            retSpace = [dictionary floatForKey:NSFileSystemFreeSize];
        } else {
            retSpace = [dictionary floatForKey:NSFileSystemSize];
        }
    }
    return retSpace;
}


CGFloat getFreeDiskspace(void) {
    return getSpace(YES);
}

CGFloat getTotalDiskspace(void) {
    return getSpace(NO);
}

int roundd(int n) {
    return (int)roundf((n / 10.0)) * 10;
}

NSArray *callStack(void) {
    void* callstack[128];
    const int numFrames = backtrace(callstack, 128);
    char **symbols = backtrace_symbols(callstack, numFrames);
    
    NSMutableArray *arr = [NSMutableArray arrayWithCapacity:numFrames];
    for (int i = 0; i < numFrames; ++i) {
        [arr addObject:[NSString stringWithUTF8String:symbols[i]]];
    }
    
    free(symbols);
    
    return arr;
}

NSFileManager *defaultFileManager(void) {
    return [NSFileManager defaultManager];
}

BOOL NSRangeEqualToRange(NSRange r1, NSRange r2) {
    return (r1.location == r2.location && r1.length == r2.length);
}

void runBlockOnMainQueueSync(void(^block)(void)) {
    void(^callable)(void) = [[block copy] autorelease];
    if ([NSThread isMainThread]) {
        @try {
            callable();
        } @catch (NSException *exc) {
            DEBUGLOG(@"Exception thrown while running a block on the main thread's queue: %@\nException: %@", callable, exc);
        } @finally {
            
        }
    } else {
        @try {
            dispatch_sync(dispatch_get_main_queue(), callable);
        } @catch (NSException *exc) {
            DEBUGLOG(@"Exception thrown while adding a block to the main thread's queue: %@\nException: %@", callable, exc);
        } @finally {
            
        }
        
    }
}
