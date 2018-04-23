//
//  UIColor+XXXExtension.h
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (XXXExtension)

#pragma mark - Retrieving Color Information
/**
 The color's red component value in RGB color space.
 The value of this property is a float in the range `0.0` to `1.0`.
 */
@property (nonatomic, readonly) CGFloat red;

/**
 The color's green component value in RGB color space.
 The value of this property is a float in the range `0.0` to `1.0`.
 */
@property (nonatomic, readonly) CGFloat green;

/**
 The color's blue component value in RGB color space.
 The value of this property is a float in the range `0.0` to `1.0`.
 */
@property (nonatomic, readonly) CGFloat blue;
/**
 The color's alpha component value.
 The value of this property is a float in the range `0.0` to `1.0`.
 */
@property (nonatomic, readonly) CGFloat alpha;

#pragma mark - Get color's description

/**
 Returns the rgb value in hex.
 @return hex value of RGB,such as 0x66ccff.
 */
- (uint32_t)rgbValue;

/**
 Returns the rgba value in hex.
 
 @return hex value of RGBA,such as 0x66ccffff.
 */
- (uint32_t)rgbaValue;

/**
 Returns the color's RGB value as a hex string (lowercase).
 Such as @"0066cc".
 
 It will return nil when the color space is not RGB
 
 @return The color's value as a hex string.
 */
- (nullable NSString *)hexString;

/**
 Returns the color's RGBA value as a hex string (lowercase).
 Such as @"0066ccff".
 
 It will return nil when the color space is not RGBA
 
 @return The color's value as a hex string.
 */
- (nullable NSString *)hexStringWithAlpha;

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
#ifndef kBlackColor
#define kBlackColor         [UIColor blackColor]
#endif

#ifndef kWhiteColor
#define kWhiteColor         [UIColor whiteColor]
#endif

#ifndef kGrayColor
#define kGrayColor          [UIColor grayColor]
#endif

#ifndef kDarkGrayColor
#define kDarkGrayColor      [UIColor darkGrayColor]
#endif

#ifndef kLightGrayColor
#define kLightGrayColor     [UIColor lightGrayColor]
#endif

#ifndef kRedColor
#define kRedColor           [UIColor redColor]
#endif

#ifndef kGreenColor
#define kGreenColor         [UIColor greenColor]
#endif

#ifndef kBlueColor
#define kBlueColor          [UIColor blueColor]
#endif

#ifndef kCyanColor
#define kCyanColor          [UIColor cyanColor]
#endif

#ifndef kYellowColor
#define kYellowColor        [UIColor yellowColor]
#endif

#ifndef kMagentaColor
#define kMagentaColor       [UIColor magentaColor]
#endif

#ifndef kOrangeColor
#define kOrangeColor        [UIColor orangeColor]
#endif

#ifndef kPurpleColor
#define kPurpleColor        [UIColor purpleColor]
#endif

#ifndef kClearColor
#define kClearColor         [UIColor clearColor]
#endif

#ifndef kRandomColor
#define kRandomColor        RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#endif
