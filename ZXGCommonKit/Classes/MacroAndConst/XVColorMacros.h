//
//  XVColorMacros.h
//  MaoMeng
//
//  Created by feizhu on 2017/11/24.
//  Copyright © 2017年 xiaov. All rights reserved.
//

#ifndef XVColorMacros_h
#define XVColorMacros_h

// 色值相关的方法
#define RGB(r, g, b)        [UIColor colorWithRed:(r)/255.f \
                                            green:(g)/255.f \
                                             blue:(b)/255.f \
                                            alpha:1.f]

#define RGBA(r, g, b, a)    [UIColor colorWithRed:(r)/255.f \
                                            green:(g)/255.f \
                                             blue:(b)/255.f \
                                            alpha:(a)]


#define HEXCOLOR(hex)       [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 \
                                            green:((float)((hex & 0xFF00) >> 8))/255.0 \
                                             blue:((float)(hex & 0xFF))/255.0 \
                                            alpha:1.f]

#define HEXCOLORA(hex, a)   [UIColor colorWithRed:((float)(((hex) & 0xFF0000) >> 16))/255.0 \
                                            green:((float)(((hex) & 0x00FF00) >> 8))/255.0 \
                                             blue:((float)(hex & 0x0000FF))/255.0 \
                                            alpha:(a)]

// 定义通用颜色
#define kBlackColor         [UIColor blackColor]
#define kWhiteColor         [UIColor whiteColor]
#define kGrayColor          [UIColor grayColor]
#define kDarkGrayColor      [UIColor darkGrayColor]
#define kLightGrayColor     [UIColor lightGrayColor]
#define kRedColor           [UIColor redColor]
#define kGreenColor         [UIColor greenColor]
#define kBlueColor          [UIColor blueColor]
#define kCyanColor          [UIColor cyanColor]
#define kYellowColor        [UIColor yellowColor]
#define kMagentaColor       [UIColor magentaColor]
#define kOrangeColor        [UIColor orangeColor]
#define kPurpleColor        [UIColor purpleColor]
#define kClearColor         [UIColor clearColor]
#define kRandomColor        RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#endif
