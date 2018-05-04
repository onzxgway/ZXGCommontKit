//
//  ZXGRootTableView.m
//  Pods
//
//  Created by 朱献国 on 2018/4/26.
//
//

#import "ZXGRootTableView.h"

@interface ZXGRootTableView ()

@end

@implementation ZXGRootTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self setupSelf];
    }
    return self;
    
}


- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupSelf];
    }
    return self;
}

- (void)setupSelf {
    
    self.delaysContentTouches = NO;
//    self.canCancelContentTouches = YES;
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    // 禁用UITableViewWrapperView的延迟
    // Remove touch delay (since iOS 8)
    UIView *wrapView = self.subviews.firstObject;
    // UITableViewWrapperView
    if (wrapView && [NSStringFromClass(wrapView.class) hasSuffix:@"WrapperView"]) {
        for (UIGestureRecognizer *gesture in wrapView.gestureRecognizers) {
            // UIScrollViewDelayedTouchesBeganGestureRecognizer
            if ([NSStringFromClass(gesture.class) containsString:@"DelayedTouchesBegan"] ) {
                gesture.enabled = NO;
                break;
            }
        }
    }
}

//- (BOOL)touchesShouldCancelInContentView:(UIView *)view {
//    if ([view isKindOfClass:[UIControl class]]) {
//        return YES;
//    }
//    return [super touchesShouldCancelInContentView:view];
//}

@end
