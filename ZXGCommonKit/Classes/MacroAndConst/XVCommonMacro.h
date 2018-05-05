//
//  XVCommonMacro.h
//  MaoMeng
//
//  Created by feizhu on 2018/1/24.
//  Copyright © 2018年 xiaov. All rights reserved.
//

#ifndef XVCommonMacro_h
#define XVCommonMacro_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

//屏幕尺寸
#define SCREEN_WIDTH  [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
#define SCREEN_BOUNDS [[UIScreen mainScreen] bounds]

//
#define URL(u) [NSURL URLWithString:(u)]

// 字体大小(常规/粗体)
#define BOLDSYSTEMFONT(FONTSIZE)[UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]

//控件添加圆角和边框
#define VIEW_BORDER_RADIUS(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// pt 与 px 转换
#define POINTS_FROM_PIXELS(__PIXELS) (__PIXELS / [[UIScreen mainScreen] scale])
#define ONE_PIXEL POINTS_FROM_PIXELS(1.0)

//
#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]
#define NOTIFI_CENTER [NSNotificationCenter defaultCenter]
#define APPLICATION   [UIApplication sharedApplication]
#define APPDELEGATE   (AppDelegate *)[[UIApplication sharedApplication] delegate]

//应用的版本
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

//IOS的版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//获取图片
#define GET_IMAGE(imageName) [UIImage imageNamed:STRING_FORMAT(@"%@", imageName)]

//iPhone Device
#if TARGET_OS_IPHONE
#endif

//iPhone Simulator
#if TARGET_IPHONE_SIMULATOR
#endif

//NSString相关
#define STRING_FORMAT(string, args...) [NSString stringWithFormat:string, args]
#define STRING_EQUAL(x, y) [(x) isEqualToString:(y)]

//沙盒路径
#define PATH_TEMP NSTemporaryDirectory()
#define PATH_DOCUMENT [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
#define PATH_CACHE [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//日志管理
#ifdef DEBUG
    #define NSLog(fmt,...) NSLog((@"%s [Line %d]" fmt),__PRETTY_FUNCTION__,__LINE__,##__VA_ARGS__)
#else
    #define NSLog(...)
#endif

//线程相关
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(), block)
#define DISPATCH_Time(time)  dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC)
#define DISPATCH_BACK(disTime, block) dispatch_after(disTime, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void){dispatch_async(dispatch_get_main_queue(), block);});

// Block
typedef void (^VoidBlock)(void);
typedef BOOL (^BoolBlock)(void);
typedef int  (^IntBlock) (void);
typedef id   (^IDBlock)  (void);

typedef void (^VoidBlock_int)(int);
typedef BOOL (^BoolBlock_int)(int);
typedef int  (^IntBlock_int) (int);
typedef id   (^IDBlock_int)  (int);

typedef void (^VoidBlock_string)(NSString *);
typedef BOOL (^BoolBlock_string)(NSString *);
typedef int  (^IntBlock_string) (NSString *);
typedef id   (^IDBlock_string)  (NSString *);

typedef void (^VoidBlock_id)(id);
typedef BOOL (^BoolBlock_id)(id);
typedef int  (^IntBlock_id) (id);
typedef id   (^IDBlock_id)  (id);

#endif /* XVCommonMacro_h */
