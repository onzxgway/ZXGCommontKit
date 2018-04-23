//
//  UIView+XXXExtension.h
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provides extensions for `UIView`.
 */
@interface UIView (XXXExtension)

//可以轻松设置控件位置而不需要使用CGRectMake.....
@property (nonatomic) CGFloat left;        // Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         // Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       // Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      // Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       // Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      // Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     // Shortcut for center.x
@property (nonatomic) CGFloat centerY;     // Shortcut for center.y
@property (nonatomic) CGPoint origin;      // Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        // Shortcut for frame.size.

/**
 Returns the view's view controller (may be nil).
 */
@property (nullable, nonatomic, readonly) UIViewController *viewController;

/**
 移除所有子控件
 
 @warning Never call this method inside your view's drawRect: method.
 */
- (void)removeAllSubviews;

/**
 Shortcut to set the view.layer's CornerRadius and CornerBorder

 @param radius 圆角半径
 @param color 圆角边框颜色
 @param width 圆角边框宽度
 */
- (void)setLayerCornerRadius:(CGFloat)radius andBorder:(nullable UIColor *)color width:(CGFloat)width;

/**
 Shortcut to set the view.layer's shadow
 
 @param color  阴影颜色
 @param offset 阴影offset
 @param radius 阴影radius
 */
- (void)setLayerShadow:(nullable UIColor*)color offset:(CGSize)offset radius:(CGFloat)radius;

@end

NS_ASSUME_NONNULL_END
