//
//  CALayer+XXXExtension.h
//  ZXGCommontKit-BaseClassResources
//
//  Created by 朱献国 on 2018/5/3.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

/**
 Provides extensions for `CALayer`.
 */
@interface CALayer (XXXExtension)

@property (nonatomic) CGFloat left;        // Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         // Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       // Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      // Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       // Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      // Shortcut for frame.size.height.
@property (nonatomic) CGPoint center;      // Shortcut for center.
@property (nonatomic) CGFloat centerX;     // Shortcut for center.x
@property (nonatomic) CGFloat centerY;     // Shortcut for center.y
@property (nonatomic) CGPoint origin;      // Shortcut for frame.origin.
@property (nonatomic, getter=frameSize, setter=setFrameSize:) CGSize  size; // Shortcut for frame.size.

@end

NS_ASSUME_NONNULL_END
