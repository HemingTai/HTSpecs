//
//  HTCrashConfiguration.h
//  Exercise_OC
//
//  Created by Hem1ng on 2019/7/24.
//  Copyright © 2019 Hem1ng. All rights reserved.
//

#import <UIKit/UIKit.h>

// !!!: ==================== Const ====================

//! 日志标题线
UIKIT_EXTERN NSString * const HTCrashReporterTitleSeparator;
//! 日志分隔线
UIKIT_EXTERN NSString * const HTCrashReporterBottomSeparator;

// !!!: ==================== Enums ====================

//! 崩溃类型
typedef NS_ENUM(NSInteger, HTCrashType) {
    //! 字符串所有崩溃
    HTCrashTypeStringAll,
    //! 字符串截取子串越界
    HTCrashTypeStringRangeOrIndexOutOfBounds,
    //! 数组所有崩溃
    HTCrashTypeArrayAll,
    //! 数组越界
    HTCrashTypeArrayIndexBeyondBounds,
    //! 数组插入nil对象
    HTCrashTypeArrayAttemptToInsertNilObject,
    //! 字典所有崩溃
    HTCrashTypeDictionaryAll,
    //! 字典插入nil对象
    HTCrashTypeDictionaryAttemptToInsertNilObject,
    //! 对象所有崩溃
    HTCrashTypeObjectAll,
    //! KVO
    HTCrashTypeObjectKVO,
    //! 未找到方法
    HTCrashTypeObjectUnrecognizedSelectorSentToInstance,
    //! 所有崩溃
    HTCrashTypeAll,
};
