//
//  ZXGBaseWKWebViewController.h
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/20.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "ZXGBaseWebViewModel.h"
#import "XVColorMacros.h"
#import "XVCommonMacro.h"
#import "IOSDeviceMacro.h"

@interface ZXGBaseWKWebViewController : UIViewController <WKNavigationDelegate, WKUIDelegate> {
@protected
    ZXGBaseWebViewModel *_contentModel;
    
    WKWebView              *_webView;
}

/** model*/
@property (nonatomic, strong) ZXGBaseWebViewModel *contentModel;

/** 分享按钮点击事件*/
- (void)shareButtonClick:(UIBarButtonItem *)barBtnItem;

@end
