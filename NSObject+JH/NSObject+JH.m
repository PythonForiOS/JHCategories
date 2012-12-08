/*
 *  NSObject+JH.m
 *  Python for iOS
 *
 *  Author: Jonathan Hosmer
 *  Date: 2/4/12
 *
 *  Copyright 2012 Jonathan Hosmer
 *  http://pythonforios.com
 */
    
#import "NSObject+JH.h"

#if defined(TARGET_OS_IPHONE) && TARGET_OS_IPHONE
#    import <objc/runtime.h>
#    import <objc/message.h>
#else
#    import <objc/objc-class.h>
#endif

#define SetNSErrorFor(FUNC, ERROR_VAR, FORMAT,...)	\
    if (ERROR_VAR) {	\
        NSString *errStr = [NSString stringWithFormat:@"%s: " FORMAT,FUNC,##__VA_ARGS__]; \
        *ERROR_VAR = [NSError errorWithDomain:@"NSCocoaErrorDomain" code:-1	userInfo:[NSDictionary dictionaryWithObject:errStr forKey:NSLocalizedDescriptionKey]]; \
    }

#define SetNSError(ERROR_VAR, FORMAT,...) SetNSErrorFor(__func__, ERROR_VAR, FORMAT, ##__VA_ARGS__)

#if OBJC_API_VERSION >= 2
#    define GetClass(obj)	object_getClass(obj)
#else
#    define GetClass(obj)	(obj ? obj->isa : Nil)
#endif

@implementation NSObject (JH)

+ (NSDictionary *)classPropsForClass:(Class)theClass {
    return [self classPropsForClass:theClass recurseUpToSuperclass:theClass];
}

+ (NSDictionary *)classPropsForClass:(Class)theClass recurseUpToSuperclass:(Class)superclassStop {
    if (!(theClass && [theClass isSubclassOfClass:superclassStop])) {
        return [NSDictionary dictionary];
    }
    NSMutableDictionary *results = [[NSMutableDictionary alloc] initWithCapacity:0];

    while ([theClass isSubclassOfClass:superclassStop]) {
        uint outCount = 0;
        objc_property_t *properties = class_copyPropertyList(theClass, &outCount);
        for (uint i = 0; i < outCount; ++i) {
            objc_property_t property = properties[i];
            
            const char * propName = property_getName(property);
            if (propName) {
                const char * propType = getPropertyType(property);
                NSString *type = [NSString stringWithUTF8String:propType];
                NSString *name = [NSString stringWithUTF8String:propName];
                if (type && name) {
                    [results setObject:type forKey:name];
                } else if (type) {
                    DEBUGLOG(@"** NO NAME FOR PROPERTY TYPE: %@ **", type);
                } else if (name) {
                    DEBUGLOG(@"** NO TYPE FOR PROPERTY NAMED: %@ **", name);
                }
            }
        }
        free(properties);
        theClass = [theClass superclass];
        if (!theClass) {
            break;
        }
    }
    
    // returning a copy here to make sure the dictionary is immutable
    return [NSDictionary dictionaryWithDictionary:[results autorelease]];
}

+ (BOOL)swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error_ {
#if OBJC_API_VERSION >= 2
	Method origMethod = class_getInstanceMethod(self, origSel_);
	if (!origMethod) {
#if defined(TARGET_OS_IPHONE) && TARGET_OS_IPHONE
		SetNSError(error_, @"original method %@ not found for class %@", NSStringFromSelector(origSel_), [self class]);
#else
		SetNSError(error_, @"original method %@ not found for class %@", NSStringFromSelector(origSel_), [self className]);
#endif
		return NO;
	}
	
	Method altMethod = class_getInstanceMethod(self, altSel_);
	if (!altMethod) {
#if defined(TARGET_OS_IPHONE) && TARGET_OS_IPHONE
		SetNSError(error_, @"alternate method %@ not found for class %@", NSStringFromSelector(altSel_), [self class]);
#else
		SetNSError(error_, @"alternate method %@ not found for class %@", NSStringFromSelector(altSel_), [self className]);
#endif
		return NO;
	}
	
	class_addMethod(self,
					origSel_,
					class_getMethodImplementation(self, origSel_),
					method_getTypeEncoding(origMethod));
	class_addMethod(self,
					altSel_,
					class_getMethodImplementation(self, altSel_),
					method_getTypeEncoding(altMethod));
	
	method_exchangeImplementations(class_getInstanceMethod(self, origSel_), class_getInstanceMethod(self, altSel_));
	return YES;
#else
	//	Scan for non-inherited methods.
	Method directOriginalMethod = NULL, directAlternateMethod = NULL;
	
	void *iterator = NULL;
	struct objc_method_list *mlist = class_nextMethodList(self, &iterator);
	while (mlist) {
		int method_index = 0;
		for (; method_index < mlist->method_count; method_index++) {
			if (mlist->method_list[method_index].method_name == origSel_) {
				assert(!directOriginalMethod);
				directOriginalMethod = &mlist->method_list[method_index];
			}
			if (mlist->method_list[method_index].method_name == altSel_) {
				assert(!directAlternateMethod);
				directAlternateMethod = &mlist->method_list[method_index];
			}
		}
		mlist = class_nextMethodList(self, &iterator);
	}
	
	//	If either method is inherited, copy it up to the target class to make it non-inherited.
	if (!directOriginalMethod || !directAlternateMethod) {
		Method inheritedOriginalMethod = NULL, inheritedAlternateMethod = NULL;
		if (!directOriginalMethod) {
			inheritedOriginalMethod = class_getInstanceMethod(self, origSel_);
			if (!inheritedOriginalMethod) {
				SetNSError(error_, @"original method %@ not found for class %@", NSStringFromSelector(origSel_), [self className]);
				return NO;
			}
		}
		if (!directAlternateMethod) {
			inheritedAlternateMethod = class_getInstanceMethod(self, altSel_);
			if (!inheritedAlternateMethod) {
				SetNSError(error_, @"alternate method %@ not found for class %@", NSStringFromSelector(altSel_), [self className]);
				return NO;
			}
		}
		
		int hoisted_method_count = !directOriginalMethod && !directAlternateMethod ? 2 : 1;
		struct objc_method_list *hoisted_method_list = malloc(sizeof(struct objc_method_list) + (sizeof(struct objc_method)*(hoisted_method_count-1)));
        hoisted_method_list->obsolete = NULL;	// soothe valgrind - apparently ObjC runtime accesses this value and it shows as uninitialized in valgrind
		hoisted_method_list->method_count = hoisted_method_count;
		Method hoisted_method = hoisted_method_list->method_list;
		
		if (!directOriginalMethod) {
			bcopy(inheritedOriginalMethod, hoisted_method, sizeof(struct objc_method));
			directOriginalMethod = hoisted_method++;
		}
		if (!directAlternateMethod) {
			bcopy(inheritedAlternateMethod, hoisted_method, sizeof(struct objc_method));
			directAlternateMethod = hoisted_method;
		}
		class_addMethods(self, hoisted_method_list);
	}
	
	//	Swizzle.
	IMP temp = directOriginalMethod->method_imp;
	directOriginalMethod->method_imp = directAlternateMethod->method_imp;
	directAlternateMethod->method_imp = temp;
	
	return YES;
#endif
}

+ (BOOL)swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error_ {
	return [GetClass((id)self) swizzleMethod:origSel_ withMethod:altSel_ error:error_];
}

- (void)printDescription {
    DEBUGLOG(@"%@", [self description]);
}

#if defined(__i386__)
- (NSString *)allProperties {
    NSMutableString *string = [NSMutableString stringWithCapacity:0];
    unsigned int propertyCount = 0;
    objc_property_t *properties = class_copyPropertyList([self class], &propertyCount);
    for (unsigned int i = 0; i < propertyCount; ++i) {
        objc_property_t property = properties[i];
        const char *attr = property_getAttributes(property);
        const char *propName = property_getName(property);
        NSString *selector = [NSString stringWithCString:property_getName(properties[i]) encoding:NSUTF8StringEncoding] ;
        SEL sel = sel_registerName([selector UTF8String]);
        
        if (![self respondsToSelector:sel])
            continue;
        
        [string appendFormat:@"%s: ", propName];
        switch (attr[1]) {
            case '@':
                [string appendFormat:@"%@", objc_msgSend(self, sel)];
                break;
            case 'i':
                [string appendFormat:@"%i", (int)objc_msgSend(self, sel)];
                break;
            case 'f':
                [string appendFormat:@"%f", objc_msgSend_fpret(self, sel, nil)];
                break;
            default:
                break;
        }
        [string appendString:@"\n"];
    }
    free(properties);
    return string;
}
#elif defined(__x86_64__)
- (NSString *)allProperties {
    return [NSString string];
}
#elif defined(__arm__)
- (NSString *)allProperties {
    return [NSString string];
}
#else
- (NSString *)allProperties {
    return nil;
}
#endif

@end

