//
//  ZXGBaseWKWebViewController.h
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/20.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "ZXGBaseWebViewModel.h"
//#import "NJKWebViewProgress.h"
//#import "NJKWebViewProgressView.h"
#import "XVColorMacros.h"
#import "XVCommonMacro.h"
#import "IOSDeviceMacro.h"

@interface ZXGBaseWKWebViewController : UIViewController <WKNavigationDelegate> {
@protected
    ZXGBaseWebViewModel *_contentModel;
    
    WKWebView              *_webView;
//    NJKWebViewProgressView *_webProgressView;
//    NJKWebViewProgress     *_webProgress;
}

/** model*/
@property (nonatomic, strong) ZXGBaseWebViewModel *contentModel;

@end
