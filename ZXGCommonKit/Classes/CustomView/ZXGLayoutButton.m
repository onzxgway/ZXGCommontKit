//
//  ZXGLayoutButton.m
//  ZXGCommontKit-BaseClassResources
//
//  Created by 朱献国 on 2018/5/19.
//

#import "ZXGLayoutButton.h"

@implementation ZXGLayoutButton

#pragma mark - LifeCycle
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
    }
    return self;
}

- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self prepare];
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.imageView sizeToFit];
    [self.titleLabel sizeToFit];
    
    switch (self.layoutType) {
        case ZXGLayoutButtonTypeImageLeftTitleRight:
            [self layoutHorizontalWithLeftView:self.imageView rightView:self.titleLabel];
            break;
        case ZXGLayoutButtonTypeImageRightTitleLeft:
            [self layoutHorizontalWithLeftView:self.titleLabel rightView:self.imageView];
            break;
        case ZXGLayoutButtonTypeImageTopTitleBottom:
            [self layoutVerticalWithUpView:self.imageView downView:self.titleLabel];
            break;
        case ZXGLayoutButtonTypeImageBottomTitleTop:
            [self layoutVerticalWithUpView:self.titleLabel downView:self.imageView];
            break;
        default:
            break;
    }
}

#pragma mark - Initial
- (void)prepare {
    _margin = 8.f;
    _layoutType = ZXGLayoutButtonTypeImageLeftTitleRight;
}

#pragma mark - Private
//水平
- (void)layoutHorizontalWithLeftView:(UIView *)leftView rightView:(UIView *)rightView {
    CGRect leftViewFrame = leftView.frame;
    CGRect rightViewFrame = rightView.frame;
    
    CGFloat totalWidth = CGRectGetWidth(leftViewFrame) + _margin + CGRectGetWidth(rightViewFrame);
    
    leftViewFrame.origin.x = (CGRectGetWidth(self.frame) - totalWidth) * 0.5;
    leftViewFrame.origin.y = (CGRectGetHeight(self.frame) - CGRectGetHeight(leftViewFrame)) * 0.5;
    leftView.frame = leftViewFrame;
    
    rightViewFrame.origin.x = CGRectGetMaxX(leftViewFrame) + _margin;
    rightViewFrame.origin.y = (CGRectGetHeight(self.frame) - CGRectGetHeight(rightViewFrame)) * 0.5;
    rightView.frame = rightViewFrame;
}

//垂直
- (void)layoutVerticalWithUpView:(UIView *)upView downView:(UIView *)downView {
    CGRect upViewFrame = upView.frame;
    CGRect downViewFrame = downView.frame;
    
    CGFloat totalHeight = CGRectGetHeight(upViewFrame) + _margin + CGRectGetHeight(downViewFrame);
    
    upViewFrame.origin.y = (CGRectGetHeight(self.frame) - totalHeight) * 0.5;
    upViewFrame.origin.x = (CGRectGetWidth(self.frame) - CGRectGetWidth(upViewFrame)) * 0.5;
    upView.frame = upViewFrame;
    
    downViewFrame.origin.y = CGRectGetMaxY(upViewFrame) + _margin;
    downViewFrame.origin.x = (CGRectGetWidth(self.frame) - CGRectGetWidth(downViewFrame)) * 0.5;
    downView.frame = downViewFrame;
}

//- (void)setImage:(UIImage *)image forState:(UIControlState)state {
//    [super setImage:image forState:state];
//    [self setNeedsLayout];
//}
//
//- (void)setTitle:(NSString *)title forState:(UIControlState)state {
//    [super setTitle:title forState:state];
//    [self setNeedsLayout];
//}
//
//- (void)setMidSpacing:(CGFloat)midSpacing {
//    _midSpacing = midSpacing;
//    [self setNeedsLayout];
//}

@end
