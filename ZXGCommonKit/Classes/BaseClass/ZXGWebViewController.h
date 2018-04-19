//
//  ZXGWebViewController.h
//  Packaging
//
//  Created by 朱献国 on 2018/4/18.
//  Copyright © 2018年 朱献国. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZXGWebViewModel.h"
#import "NJKWebViewProgress.h"
#import "NJKWebViewProgressView.h"
#import <JavaScriptCore/JavaScriptCore.h>

@protocol ZXGJSExport <JSExport>

/** handleFactorialCalculateWithNumber 作为js方法的别名 */
JSExportAs(calculateForJS, - (void)handleFactorialCalculateWithNumber:(NSNumber *)number);

@end


@interface ZXGWebViewController : UIViewController <ZXGJSExport>

/** model*/
@property (nonatomic, strong) ZXGWebViewModel *contentModel;

@end
