//
//  iOSDeviceConfig.h
//  Vlive
//
//  Created by feizhu on 2018/2/3.
//  Copyright © 2018年 xiaov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface iOSDeviceConfig : NSObject

// 固有属性
@property (nonatomic, readonly, assign) BOOL isiPad;

@property (nonatomic, readonly, assign) BOOL isiPhone;

@property (nonatomic, readonly, assign) BOOL is35Screen;

@property (nonatomic, readonly, assign) BOOL is40Screen;

@property (nonatomic, readonly, assign) BOOL is47Screen;

@property (nonatomic, readonly, assign) BOOL is55Screen;

@property (nonatomic, readonly, assign) BOOL is58Screen;


@property (nonatomic, readonly, assign) BOOL isIOS9;

@property (nonatomic, readonly, assign) BOOL isIOS10;

@property (nonatomic, readonly, assign) BOOL isIOS11;


@property (nonatomic, readonly, assign) BOOL isIOS9Later;

@property (nonatomic, readonly, assign) BOOL isIOS10Later;

@property (nonatomic, readonly, assign) BOOL isIOS11Later;


// 全局设置
@property (nonatomic, readonly, assign) BOOL isPortrait;

+ (instancetype)sharedConfig;

@end
