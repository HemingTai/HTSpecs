//
//  NSObject+Swizzling.m
//  Exercise_OC
//
//  Created by Hem1ng on 2019/7/23.
//  Copyright © 2019 Hem1ng. All rights reserved.
//

#import "NSObject+Swizzling.h"
#import "HTCrashReporter.h"
#import "HTCrashProxy.h"

@implementation NSObject (Swizzling)

+ (void)ht_interceptObjectAllCrash {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self ht_interceptObjectCrashCausedByKVO];
        [self ht_interceptObjectCrashCausedByUnrecognizedSelectorSentToInstance];
    });
}

+ (void)ht_interceptObjectCrashCausedByKVO {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [HTCrashReporter ht_swizzleInstanceMethodForClass:[self class] originalSelector:@selector(setValue:forKey:) swizzlingSelector:@selector(ht_setValue:forKey:)];
        
        [HTCrashReporter ht_swizzleInstanceMethodForClass:[self class] originalSelector:@selector(setValue:forKeyPath:) swizzlingSelector:@selector(ht_setValue:forKeyPath:)];
        
        [HTCrashReporter ht_swizzleInstanceMethodForClass:[self class] originalSelector:@selector(setValue:forUndefinedKey:) swizzlingSelector:@selector(ht_setValue:forUndefinedKey:)];
        
        [HTCrashReporter ht_swizzleInstanceMethodForClass:[self class] originalSelector:@selector(setValuesForKeysWithDictionary:) swizzlingSelector:@selector(ht_setValuesForKeysWithDictionary:)];
    });
}

+ (void)ht_interceptObjectCrashCausedByUnrecognizedSelectorSentToInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [HTCrashReporter ht_swizzleInstanceMethodForClass:[self class] originalSelector:@selector(methodSignatureForSelector:) swizzlingSelector:@selector(ht_methodSignatureForSelector:)];
        [HTCrashReporter ht_swizzleInstanceMethodForClass:[self class] originalSelector:@selector(forwardInvocation:) swizzlingSelector:@selector(ht_forwardInvocation:)];
    });
}

- (void)ht_setValue:(nullable id)value forKey:(NSString *)key {
    @try {
        [self ht_setValue:value forKey:key];
    } @catch (NSException *exception) {
        [HTCrashReporter ht_catchException:exception withCrashType:HTCrashTypeObjectKVO];
    } @finally {
        
    }
}

- (void)ht_setValue:(nullable id)value forKeyPath:(NSString *)keyPath {
    @try {
        [self ht_setValue:value forKeyPath:keyPath];
    } @catch (NSException *exception) {
        [HTCrashReporter ht_catchException:exception withCrashType:HTCrashTypeObjectKVO];
    } @finally {
        
    }
}

- (void)ht_setValue:(nullable id)value forUndefinedKey:(NSString *)key {
    @try {
        [self ht_setValue:value forUndefinedKey:key];
    } @catch (NSException *exception) {
        [HTCrashReporter ht_catchException:exception withCrashType:HTCrashTypeObjectKVO];
    } @finally {
        
    }
}

- (void)ht_setValuesForKeysWithDictionary:(NSDictionary<NSString *, id> *)keyedValues {
    @try {
        [self ht_setValuesForKeysWithDictionary:keyedValues];
    } @catch (NSException *exception) {
        [HTCrashReporter ht_catchException:exception withCrashType:HTCrashTypeObjectKVO];
    } @finally {
        
    }
}

- (NSMethodSignature *)ht_methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [self ht_methodSignatureForSelector:aSelector];
    if (signature == nil) {
        signature = [HTCrashProxy instanceMethodSignatureForSelector:@selector(ht_handleCrashMethod)];
    }
    return signature;
}

- (void)ht_forwardInvocation:(NSInvocation *)anInvocation {
    @try {
        [self ht_forwardInvocation:anInvocation];
    } @catch (NSException *exception) {
        [HTCrashReporter ht_catchException:exception withCrashType:HTCrashTypeObjectUnrecognizedSelectorSentToInstance];
    } @finally {
        
    }
}

@end
