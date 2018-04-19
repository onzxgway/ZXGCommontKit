//
//  ZXGWebViewController.m
//  封装
//
//  Created by 朱献国 on 2018/4/18.
//  Copyright © 2018年 朱献国. All rights reserved.
//

#import "ZXGBaseWebViewController.h"
#import "Masonry.h"

@interface ZXGBaseWebViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation ZXGBaseWebViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    if (_webProgressView) {
        [self.navigationController.navigationBar addSubview:_webProgressView];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    if (_webProgressView) {
        [_webProgressView removeFromSuperview];
    }
    
    [self cleanCacheAndCookie];
}

- (void)dealloc {
    [self cleanCacheAndCookie];
}


#pragma mark - CreateViews
- (void)initUI {
    self.view.backgroundColor = [UIColor blackColor];
    
    //页面标题
    if (!_contentModel.pageTitle) {
        self.title = @"暂无标题";
    }
    else {
        self.title = _contentModel.pageTitle;
    }
    
    //分享
    if (ZXGWebPageDisplayTypeNormal == _contentModel.type) {
        
    }
    else if (ZXGWebPageDisplayTypeShare == _contentModel.type) {
        [self createSubViews:YES];
        //加载链接
        [self loadWebviewUrl:_contentModel.articleLinkStr];
    }
}

// hasShare   导航栏右边是否有分享按钮 YES:显示右边按钮  NO:不显示右边按钮
- (void)createSubViews:(BOOL)hasShare {
    
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    if (hasShare) {
        //右边分享按钮
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"activity_share"] style:UIBarButtonItemStyleDone target:self action:@selector(shareButtonClick)];
    }
    
    //添加进度条
    _webProgress = [[NJKWebViewProgress alloc] init];
    _webView.delegate = _webProgress;
    _webProgress.progressDelegate = self;
    _webProgress.webViewProxyDelegate = self;
    
    CGRect navFrame = self.navigationController.navigationBar.frame;
    CGRect barFrame = CGRectMake(0, navFrame.size.height, navFrame.size.width, 2.0f);
    _webProgressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _webProgressView.progressBarView.backgroundColor = HEXCOLOR(0xff6f26);
    [_webProgressView setProgress:0.0 animated:YES];
    
}

#pragma mark - Private
- (void)shareButtonClick {
    
}

// 清除UIWebView的缓存
- (void)cleanCacheAndCookie {
    
    NSURLCache *cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    [cache setDiskCapacity:0];
    [cache setMemoryCapacity:0];
}

//加载url链接
- (void)loadWebviewUrl:(NSString *)urlStr {
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]]];
}

#pragma mark - LazyLoad
- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.delegate = self;
        _webView.scalesPageToFit = YES;
        _webView.mediaPlaybackAllowsAirPlay = YES;
        if (IS_IOS11()) {
            _webView.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
    }
    return _webView;
}

#pragma mark - Network

#pragma mark - UIWebViewDelegate
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
}

#pragma mark - NJKWebViewProgressDelegate
- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress {
    [_webProgressView setProgress:progress animated:YES];
}

@end
