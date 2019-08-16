//
//  NSObject+Swizzling.h
//  Exercise_OC
//
//  Created by Hem1ng on 2019/7/23.
//  Copyright © 2019 Hem1ng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Swizzling)

//! 拦截对象所有崩溃
+ (void)ht_interceptObjectAllCrash;

//! 拦截由于KVO引起的崩溃
+ (void)ht_interceptObjectCrashCausedByKVO;

//! 拦截由于未找到方法引起的崩溃
+ (void)ht_interceptObjectCrashCausedByUnrecognizedSelectorSentToInstance;

@end

NS_ASSUME_NONNULL_END
