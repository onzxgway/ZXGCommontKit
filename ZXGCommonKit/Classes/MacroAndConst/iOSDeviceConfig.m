//
//  iOSDeviceConfig.m
//  Vlive
//
//  Created by feizhu on 2018/2/3.
//  Copyright © 2018年 xiaov. All rights reserved.
//

#import "iOSDeviceConfig.h"
#import "IOSDeviceMacro.h"

@implementation iOSDeviceConfig

+ (instancetype)sharedConfig {
    __block iOSDeviceConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

#pragma mark - Overwrite
- (instancetype)init {
    self = [super init];
    if (self) {
        _isiPad = ISIPAD();
        _isiPhone = ISIPHONE();

        _is35Screen = IS_35INCH_SCREEN();
        _is40Screen = IS_40INCH_SCREEN();
        _is47Screen = IS_47INCH_SCREEN();
        _is55Screen = IS_55INCH_SCREEN();
        _is58Screen = IS_58INCH_SCREEN();

        _isIOS9 = IS_IOS9();
        _isIOS10 = IS_IOS10();
        _isIOS11 = IS_IOS11();

        _isIOS9Later = IOS_VERSION_GREATER_THAN_OR_EQUAL_TO(@"9");
        _isIOS10Later = IOS_VERSION_GREATER_THAN_OR_EQUAL_TO(@"10");
        _isIOS11Later = IOS_VERSION_GREATER_THAN_OR_EQUAL_TO(@"11");
    }
    return self;
}

- (BOOL)isPortrait {
    return UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation);
}

@end
