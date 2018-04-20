//
//  UIImage+Common.h
//  ZhuXianGuo
//
//  Created by feizhu on 2018/1/22.
//  Copyright © 2018年 xiaov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Common)

- (CGSize)calculateNewSizeForCroppingBox:(CGSize)croppingBox;

// path为图片的键值
//- (void)saveToCacheWithKey:(NSString *)key;

//+ (UIImage *)loadFromCacheWithKey:(NSString *)key;

@end



@interface UIImage (Cut)

/**
 图片裁剪 截取当前图像cropRect区域内的图像

 @param cropRect 裁剪的rect (原图的左上角是参考原点)
 @return 裁剪后的图片
 */
- (UIImage *)cropImage:(CGRect)cropRect;

/**
 图片裁剪

 @param cropRect 裁剪的rect (原图的左上角是参考原点)
 @return 裁剪后的图片
 */
- (UIImage *)cropToRectImage:(CGRect)cropRect;

/**
 把图片裁剪成正方形 （原图的中心点为基点）

 @return 正方形图片
 */
- (UIImage *)cropToSquareImage;

/**
 待定

 @param cropSize <#cropSize description#>
 @return 图片
 */
- (UIImage *)cropCenterAndScaleImageToSize:(CGSize)cropSize;

/**
 UIView转化为UIImage

 @param view <#view description#>
 @return 图片
 */
+ (UIImage *)imageFromView:(UIView *)view;

- (UIImage *)clipImageWithScaleWithsize:(CGSize)asize;

- (UIImage *)clipImageWithScaleWithsize:(CGSize)asize roundedCornerImage:(NSInteger)cornerRadius borderSize:(NSInteger)borderSize;

@end



@interface UIImage (Color)

/**
 获取灰度图（彩色 —> 黑白图）

 @return 图片
 */
- (UIImage *)convertToGrayImage;

/**
 获取图片某一点的颜色

 @param point 图片上的某点
 @return 图片
 */
- (UIColor *)colorAtPixel:(CGPoint)point;

/**
 获取指定颜色和大小的纯色图片

 @param color 图片颜色
 @param size 图片大小
 @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;
+ (UIImage *)imageWithColor:(UIColor *)color; //不设置UIImageView的大小，则不显示

/**
 获取指定大小的随机颜色图片

 @param size 图片大小
 @return 图片
 */
+ (UIImage *)imageWithRandomColor:(CGSize)size;
+ (UIImage *)imageWithRandomColor;

@end




@interface UIImage (Rotate)

/**
 修正图片的方向

 @return 图片
 */
- (UIImage *)fixOrientation;

/**
 按指定的方向旋转图片 (尺寸不变)

 @param imageOrientation 图片方向
 @return 图片
 */
- (UIImage*)imageRotatedByDirection:(UIImageOrientation)imageOrientation;

/**
 垂直翻转

 @return 图片
 */
- (UIImage *)flipVertical;

/**
 水平翻转

 @return 图片
 */
- (UIImage *)flipHorizontal;

/**
 按指定的角度旋转图片

 @param degrees 旋转角度
 @return 图片
 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

/**
 按指定的弧度旋转图片

 @param radians 旋转弧度
 @return 图片
 */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

@end


@interface UIImage (RoundedCorner)

/**
 给图片加圆角

 @param cornerRadius 圆角的半径
 @param borderSize 切割线的宽度
 @return 图片
 */
- (UIImage *)roundedCornerImage:(CGFloat)cornerRadius borderSize:(CGFloat)borderSize;

/**
 把图片剪裁为圆形 (圆图的中心和原图的中心重合)

 @return 图片
 */
- (UIImage *)roundImage;

- (void)addRoundedRectToPath:(CGRect)rect context:(CGContextRef)context ovalWidth:(CGFloat)ovalWidth ovalHeight:(CGFloat)ovalHeight;

@end

@interface UIImage (Alpha)

- (BOOL)hasAlpha;

- (UIImage *)imageWithAlpha;

- (UIImage *)transparentBorderImage:(NSUInteger)borderSize;

@end


@interface UIImage (Gif)

/**
 Gif转换为Image

 @param theData 传入GIFData
 @return 图片
 */
+ (UIImage *)imageWithGIFData:(NSData *)theData;

/**
 Gif转换为Image

 @param theURL 传入GIF路径
 @return 图片
 */
+ (UIImage *)imageWithGIFURL:(NSURL *)theURL;

@end


@interface UIImage (Splice)

/**
 在指定的size里面生成一个平铺的图片

 @param size <#size description#>
 @return <#return value description#>
 */
- (UIImage *)tiledImageWithSize:(CGSize)size;

/**
 将两张图片拼成一张图片

 @param firstImage Image
 @param secondImage Image
 @return 图片
 */
+ (UIImage *)mergeImage:(UIImage *)firstImage withImage:(UIImage *)secondImage;

/**
 将一张图片切割成两张图片

 @param image 原图
 @return 图片集合
 */
+ (NSArray *)splitImageIntoTwoParts:(UIImage *)image;

@end



@interface UIImage (Resize)

/**
 Resize为指定大小的正方形图片

 @param thumbnailSize 不透明部分宽和高
 @param borderSize 透明边框的宽度
 @param cornerRadius 不透明部分圆角
 @param quality 图片不以原尺寸显示在屏幕上时, CGInterpolationQuality是控制缩放的，图片高清渲染速度就慢，反之亦然
 @return Resize图片
 */
- (UIImage *)thumbnailImage:(NSInteger)thumbnailSize transparentBorder:(NSUInteger)borderSize cornerRadius:(NSUInteger)cornerRadius interpolationQuality:(CGInterpolationQuality)quality;

/**
 Resize为指定大小的图片

 @param quality 图片不以原尺寸显示在屏幕上时, CGInterpolationQuality是控制缩放的，图片高清渲染速度就慢，反之亦然
 @return Resize图片
 */
- (UIImage *)resizedImage:(CGSize)newSize interpolationQuality:(CGInterpolationQuality)quality;

/**
 Resize为指定大小的图片
 @return Resize图片
 */
- (UIImage *)resizedImage:(CGSize)newSize;

- (UIImage *)resizedImageWithContentMode:(UIViewContentMode)contentMode bounds:(CGSize)bounds interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImage:(CGSize)newSize transform:(CGAffineTransform)transform drawTransposed:(BOOL)transpose interpolationQuality:(CGInterpolationQuality)quality;

- (UIImage *)resizedImageInRect:(CGRect)rect transform:(CGAffineTransform)transform drawTransposed:(BOOL)transpose interpolationQuality:(CGInterpolationQuality)quality;

- (CGAffineTransform)transformForOrientation:(CGSize)newSize;

@end

@interface UIImage (ImageEffects)

- (UIImage *)applyLightEffect;
- (UIImage *)applyExtraLightEffect;
- (UIImage *)applyDarkEffect;
- (UIImage *)applyTintEffectWithColor:(UIColor *)tintColor;
- (UIImage *)applyBlurWithRadius:(CGFloat)blurRadius tintColor:(UIColor *)tintColor saturationDeltaFactor:(CGFloat)saturationDeltaFactor maskImage:(UIImage *)maskImage;

@end

@interface UIImage (TintColor)

// tint只对里面的图案作更改颜色操作
- (UIImage *)imageWithTintColor:(UIColor *)tintColor;

- (UIImage *)imageWithTintColor:(UIColor *)tintColor blendMode:(CGBlendMode)blendMode;

- (UIImage *)imageWithGradientTintColor:(UIColor *)tintColor;

@end

//#if kSupportUIImageNonCommon
//#endif
