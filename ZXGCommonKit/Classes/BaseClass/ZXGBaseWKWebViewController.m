//
//  ZXGBaseWKWebViewController.m
//  Pods
//
//  Created by 朱献国 on 2018/4/20.
//  
//

#import "ZXGBaseWKWebViewController.h"
#import "Masonry.h"

@interface ZXGBaseWKWebViewController ()
@property (nonatomic, weak  ) CALayer *progressLayer;
@end

@implementation ZXGBaseWKWebViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController.navigationBar.layer addSublayer:self.progressLayer];
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.progressLayer removeFromSuperlayer];
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
        [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_contentModel.articleLinkStr]]];
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
    
//    //添加进度条
//    _webProgress = [[NJKWebViewProgress alloc] init];
//    _webProgress.progressDelegate = self;
//    _webProgress.webViewProxyDelegate = self;
//
//    CGRect navFrame = self.navigationController.navigationBar.frame;
//    CGRect barFrame = CGRectMake(0, navFrame.size.height, navFrame.size.width, 2.0f);
//    _webProgressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
//    _webProgressView.progressBarView.backgroundColor = HEXCOLOR(0xff6f26);
//    [_webProgressView setProgress:0.0 animated:YES];
    
}


#pragma mark - Private
- (void)shareButtonClick {
    
}

-(void)setupProgress {
    UIView *progress = [[UIView alloc] init];
    progress.frame = CGRectMake(0, 0, SCREEN_WIDTH, 3);
    progress.backgroundColor = kClearColor;
    [self.view addSubview:progress];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(0, 0, 0, 3);
    layer.backgroundColor = kRandomColor.CGColor;
    [progress.layer addSublayer:layer];
    self.progressLayer = layer;
}

#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    
    if (STRING_EQUAL(@"estimatedProgress", keyPath)) {
        self.progressLayer.opacity = 1.f;
        if ([change[@"new"] floatValue] < [change[@"old"] floatValue]) {
            return;
        }
        self.progressLayer.frame = CGRectMake(0, 0, SCREEN_WIDTH * [change[@"new"] floatValue], 3);
        if ([change[@"new"] floatValue] == 1.0) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.progressLayer.opacity = 0;
                self.progressLayer.frame = CGRectMake(0, 0, 0, 3);
            });
        }
    }
    else if ([keyPath isEqualToString:@"title"]) {
        self.title = change[@"new"];
    }
}

#pragma mark - LazyLoad
- (WKWebView *)webView {
    if (!_webView) {
        
        WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
        config.selectionGranularity = WKSelectionGranularityDynamic;
        config.allowsInlineMediaPlayback = YES;
        WKPreferences *preferences = [[WKPreferences alloc] init];
        preferences.javaScriptEnabled = YES; //是否支持JavaScript
        preferences.javaScriptCanOpenWindowsAutomatically = YES;  //不通过用户交互，是否可以打开窗口
        config.preferences = preferences;
        
        _webView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:config];
        _webView.backgroundColor = [UIColor whiteColor];
        _webView.navigationDelegate = self;
        _webView.UIDelegate = self;
        [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
        if (IS_IOS11()) {

        }
    }
    return _webView;
}

- (CALayer *)progressLayer {
    if (!_progressLayer) {
        CGRect navFrame = self.navigationController.navigationBar.frame;
        _progressLayer = [CALayer layer];
        _progressLayer.frame = CGRectMake(0, navFrame.size.height, 0, 2.0f);
        _progressLayer.backgroundColor = kRandomColor.CGColor;
    }
    return _progressLayer;
}

#pragma mark - WKNavigationDelegate
/* 页面开始加载 */
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
}

/* 开始返回内容 */
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    
}

/* 页面加载完成 */
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
}

/* 页面加载失败 */
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation {
    
}

/* 在发送请求之前，决定是否跳转 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    //允许跳转
    decisionHandler(WKNavigationActionPolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationActionPolicyCancel);
}

/* 在收到响应后，决定是否跳转 */
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler {
    NSLog(@"%@",navigationResponse.response.URL.absoluteString);
    //允许跳转
    decisionHandler(WKNavigationResponsePolicyAllow);
    //不允许跳转
    //decisionHandler(WKNavigationResponsePolicyCancel);
}




@end
