//
//  ZXGBaseWebViewModel.h
//  OCAndJS
//
//  Created by 朱献国 on 2018/4/19.
//  Copyright © 2018年 朱献国. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ZXGWebPageDisplayType) {
    ZXGWebPageDisplayTypeNormal = 0,//仅展示链接不分享
    ZXGWebPageDisplayTypeShare ,    //即展示链接也进行分享
    //    ZXGWebPageDisplayTypeShare, //可以分享的广告
};

@interface ZXGBaseWebViewModel : NSObject

/** 页面导航栏显示的标题*/
@property (nonatomic, copy  ) NSString *pageTitle;

/** 页面显示的类型*/
@property (nonatomic, assign) ZXGWebPageDisplayType type;

/** 文章链接*/
@property (nonatomic, copy  ) NSString *articleLinkStr;

@end
