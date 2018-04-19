//
//  ZXGWebViewController.m
//  封装
//
//  Created by 朱献国 on 2018/4/18.
//  Copyright © 2018年 朱献国. All rights reserved.
//

#import "ZXGWebViewController.h"

@interface ZXGWebViewController () <UIWebViewDelegate, NJKWebViewProgressDelegate>
/** <#备注#>*/
@property (nonatomic, strong) UIWebView *webView;
/** 进度条*/
@property (nonatomic, strong) NJKWebViewProgressView *webProgressView;
@property (nonatomic, strong) NJKWebViewProgress     *webProgress;

@property (strong, nonatomic) JSContext *context;

@end

@implementation ZXGWebViewController

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
    self.view.backgroundColor = kRandomColor;
    
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
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:GET_IMAGE(@"activity_share") style:UIBarButtonItemStyleDone target:self action:@selector(shareButtonClick)];
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

#pragma mark - Public

#pragma mark - LazyLoad
- (UIWebView *)webView {
    if (!_webView) {
        _webView = [[UIWebView alloc] init];
        _webView.backgroundColor = kWhiteColor;
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
    
    /**
    // js调用OC原理是  原生对URL进行拦截
    NSString *urlString = [[request URL] absoluteString];
    NSLog(@"__++%@++__", urlString);
    NSArray *urlComps = [urlString componentsSeparatedByString:@"://"];
    if([urlComps count] && [[urlComps firstObject] isEqualToString:@"objc"]) {
        NSArray *arrFucnameAndParameter = [(NSString *)[urlComps objectAtIndex:1] componentsSeparatedByString:@":/"];
        NSString *funcStr = [arrFucnameAndParameter firstObject];
        if (1 == [arrFucnameAndParameter count]) {
            // 没有参数
            if([funcStr isEqualToString:@"testFunc"]) {
                //调用本地函数
                [self testFunc];
            }
        }
        else if(2 == [arrFucnameAndParameter count]) {
            //有参数的
            if([funcStr isEqualToString:@"printLog:"] && [arrFucnameAndParameter firstObject]) {
                //调用本地函数
                [self printLog:@"js调用本地带参数的方法成功！"];
            }
        }
        return NO;
    };
*/
    
    return YES;
}

- (void)printLog:(NSString *)str {
    NSLog(@"%@", str);
}

- (void)testFunc {
    NSLog(@"js调用本地不带参数的方法成功！");
}

- (void)webViewDidStartLoad:(UIWebView *)webView {
    
    
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    // JS url加载完成后，可直接调用JS方法showmessage。 如果有需求，还可以传递参数。
//    [_webView stringByEvaluatingJavaScriptFromString:@"showResult('橘子网络')"];
    // 若JS有返回值此方法会直接返回。返回的格式为URL编码格式，所以必须解码才能使用。 下边是解码方法
    NSLog(@"webViewDidFinishLoad");
    
    // 以 html title 设置 导航栏 title
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    
    // 禁用 页面元素选择
    //[webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitUserSelect='none';"];
    
    // 禁用 长按弹出ActionSheet
    //[webView stringByEvaluatingJavaScriptFromString:@"document.documentElement.style.webkitTouchCallout='none';"];
    
    // Undocumented access to UIWebView's JSContext
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    // 打印异常
    self.context.exceptionHandler =
    ^(JSContext *context, JSValue *exceptionValue)
    {
        context.exception = exceptionValue;
        NSLog(@"%@", exceptionValue);
    };
    
    // 以 JSExport 协议关联 native 的方法
    self.context[@"native"] = self;
    
    // 以 block 形式关联 JavaScript function
    self.context[@"log"] = ^(NSString *str) {
        NSLog(@"__++%@++__", str);
    };
    
    // 以 block 形式关联 JavaScript function
    self.context[@"afdafddaf"] = ^(NSString *str) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"msg from js" message:str delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    };
    
    __block typeof(self) weakSelf = self;
    self.context[@"addSubView"] = ^(NSString *viewname) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(10, 50, 300, 100)];
        view.backgroundColor = [UIColor redColor];
        UISwitch *sw = [[UISwitch alloc]init];
        [view addSubview:sw];
        [weakSelf.view addSubview:view];
    };
    
    //多参数
    self.context[@"mutiParams"] = ^(NSString *a,NSString *b,NSString *c) {
        NSLog(@"%@ %@ %@",a,b,c);
    };
}

#pragma mark - JSExport Methods
- (void)handleFactorialCalculateWithNumber:(NSNumber *)number {
    NSLog(@"number:%@", number);
    
    NSNumber *result = [self calculateFactorialOfNumber:number];
    
    NSLog(@"result:%@", result);
    
    [self.context[@"showResult"] callWithArguments:@[@4444]];
}

- (NSNumber *)calculateFactorialOfNumber:(NSNumber *)number {
    NSInteger i = [number integerValue];
    if (i < 0) {
        return [NSNumber numberWithInteger:0];
    }
    if (i == 0) {
        return [NSNumber numberWithInteger:1];
    }
    
    NSInteger r = (i * [(NSNumber *)[self calculateFactorialOfNumber:[NSNumber numberWithInteger:(i - 1)]] integerValue]);
    
    return [NSNumber numberWithInteger:r];
}

#pragma mark - NJKWebViewProgressDelegate
- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress {
    [_webProgressView setProgress:progress animated:YES];
}

@end
