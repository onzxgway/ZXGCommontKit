//
//  UIColor+XXXExtension.h
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (XXXExtension)

/**
 Creates and returns a color object from hex string.
 
 @discussion:
 Valid format: #RGB #RGBA #RRGGBB #RRGGBBAA 0xRGB ...
 The `#` or "0x" sign is not required.
 The alpha will be set to 1.0 if there is no alpha component.
 It will return nil when an error occurs in parsing.
 
 Example: @"0xF0F", @"66ccff", @"#66CCFF88"
 
 @param hexStr  The hex string value for the new color.
 
 @return        An UIColor object from string, or nil if an error occurs.
 */
+ (nullable UIColor *)colorWithHexString:(NSString *)hexStr;

@end

NS_ASSUME_NONNULL_END

// 色值相关的方法
#ifndef RGB
#define RGB(r, g, b)        [UIColor colorWithRed:(r)/255.f \
                                            green:(g)/255.f \
                                             blue:(b)/255.f \
                                            alpha:1.f]
#endif

#ifndef RGBA
#define RGBA(r, g, b, a)    [UIColor colorWithRed:(r)/255.f \
                                            green:(g)/255.f \
                                             blue:(b)/255.f \
                                            alpha:(a)]
#endif

/*
 Create UIColor with a hex string.
 Example: UIColorHex(0xF0F), UIColorHex(66ccff), UIColorHex(#66CCFF88)
 
 Valid format: #RGB #RGBA #RRGGBB #RRGGBBAA 0xRGB ...
 The `#` or "0x" sign is not required.
 */
#ifndef UIColorHex

#define UIColorHex(_hex_)   [UIColor colorWithHexString:((__bridge NSString *)CFSTR(#_hex_))]

#endif

/**
#ifndef UIColorHex
#define UIColorHex(hex)     [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 \
                                            green:((float)((hex & 0xFF00) >> 8))/255.0 \
                                             blue:((float)(hex & 0xFF))/255.0 \
                                            alpha:1.f]
#endif

#ifndef UIColorAHex
#define UIColorAHex(hex, a) [UIColor colorWithRed:((float)(((hex) & 0xFF0000) >> 16))/255.0 \
                                            green:((float)(((hex) & 0x00FF00) >> 8))/255.0 \
                                             blue:((float)(hex & 0x0000FF))/255.0 \
                                            alpha:(a)]
#endif
 */

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
