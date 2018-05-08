//
//  ZXGBaseTableViewController.m
//  Pods
//
//  Created by 朱献国 on 2018/4/26.
//  
//

#import "ZXGBaseTableViewController.h"
#import "UIColor+XXXExtension.h"

@interface ZXGBaseTableViewController ()

@end

@implementation ZXGBaseTableViewController

#pragma mark - LifeCycle
- (instancetype)init {
    self = [super init];
    if (self) {
        _dataSource = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = kRandomColor;
}

#pragma mark - CreateViews

#pragma mark - Private

#pragma mark - Public

#pragma mark - Lazy Load
- (ZXGBaseTableView *)tableView {
    if (!_tableView) {
        _tableView = [[ZXGBaseTableView alloc] init];
        _tableView.frame = self.view.bounds;
        _tableView.dataSourceArr = self.dataSource;
        //        _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
        //        _tableView.scrollIndicatorInsets = _tableView.contentInset;
        _tableView.backgroundColor = kWhiteColor;
        _tableView.backgroundView.backgroundColor = kWhiteColor;
        _tableView.controller = self;
    }
    return _tableView;
}

#pragma mark - Network

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
