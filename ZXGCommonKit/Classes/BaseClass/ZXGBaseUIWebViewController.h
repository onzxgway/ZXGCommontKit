//
//  ZXGWebViewController.h
//  Packaging
//
//  Created by 朱献国 on 2018/4/18.
//  Copyright © 2018年 朱献国. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXGBaseWebViewModel.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "XVColorMacros.h"
#import "IOSDeviceMacro.h"

@interface ZXGBaseUIWebViewController : UIViewController <UIWebViewDelegate> {
    @protected
    ZXGBaseWebViewModel *_contentModel;
    
    UIWebView              *_webView;
}

/** model*/
@property (nonatomic, strong) ZXGBaseWebViewModel *contentModel;

@end
