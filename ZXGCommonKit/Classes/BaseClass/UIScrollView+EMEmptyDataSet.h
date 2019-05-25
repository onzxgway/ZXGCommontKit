//
//  UIScrollView+EMEmptyDataSet.h
//  ZXGCommontKit
//
//  Created by 朱献国 on 2019/5/25.
//

#import <UIKit/UIKit.h>

@protocol EMEmptyDataSetSource;
@protocol EMEmptyDataSetDelegate;

@interface UIScrollView (EMEmptyDataSet)

@property (nonatomic, weak, nullable) id<EMEmptyDataSetSource> emptyDataSetSource;
@property (nonatomic, weak, nullable) id<EMEmptyDataSetDelegate> emptyDataSetDelegate;
@property (nonatomic, readonly, getter = isEmptyDataSetVisible) BOOL emptyDataSetVisible;

- (void)reloadEmptyDataSet;

@end


@protocol EMEmptyDataSetSource <NSObject>
@optional

- (nullable NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView;
- (nullable NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView;
- (nullable UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView;
- (nullable UIColor *)imageTintColorForEmptyDataSet:(UIScrollView *)scrollView;
- (nullable CAAnimation *)imageAnimationForEmptyDataSet:(UIScrollView *)scrollView;
- (nullable NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state;
- (nullable UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state;
- (nullable UIImage *)buttonBackgroundImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state;
- (nullable UIView *)customViewForEmptyDataSet:(UIScrollView *)scrollView;
- (nullable UIColor *)backgroundColorForEmptyDataSet:(UIScrollView *)scrollView;

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView;
- (CGFloat)spaceHeightForEmptyDataSet:(UIScrollView *)scrollView;

@end


@protocol EMEmptyDataSetDelegate <NSObject>
@optional

/**
 是否显示淡入动画. 默认 YES.
 */
- (BOOL)emptyDataSetShouldFadeIn:(UIScrollView *)scrollView;
- (void)emptyDataSetWillAppear:(UIScrollView *)scrollView;
- (void)emptyDataSetDidAppear:(UIScrollView *)scrollView;
- (void)emptyDataSetWillDisappear:(UIScrollView *)scrollView;
- (void)emptyDataSetDidDisappear:(UIScrollView *)scrollView;
/**
 （当cell的个数超过0时）是否强制显示. 默认 NO
 */
- (BOOL)emptyDataSetShouldBeForcedToDisplay:(UIScrollView *)scrollView;
- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView;
- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView;
- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button;
- (void)emptyDataSet:(UIScrollView *)scrollView didTapView:(UIView *)view;
- (BOOL)emptyDataSetShouldAllowScroll:(UIScrollView *)scrollView;
- (BOOL)emptyDataSetShouldAnimateImageView:(UIScrollView *)scrollView;

@end


