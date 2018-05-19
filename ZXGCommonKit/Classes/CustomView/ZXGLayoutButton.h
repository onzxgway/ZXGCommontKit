//
//  ZXGLayoutButton.h
//  ZXGCommontKit-BaseClassResources
//
//  Created by 朱献国 on 2018/5/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZXGLayoutButtonType) {
    ZXGLayoutButtonTypeImageLeftTitleRight,
    ZXGLayoutButtonTypeImageRightTitleLeft,
    ZXGLayoutButtonTypeImageTopTitleBottom,
    ZXGLayoutButtonTypeImageBottomTitleTop,
};

@interface ZXGLayoutButton : UIButton

// 布局方式，默认值ZXGLayoutButtonTypeImageLeftTitleRight
@property (nonatomic) ZXGLayoutButtonType layoutType;

// 图片和文字的间距，默认值8
@property (nonatomic) CGFloat margin;

@end

NS_ASSUME_NONNULL_END
