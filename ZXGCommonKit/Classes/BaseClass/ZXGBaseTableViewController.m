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
        _tableView.backgroundColor = kRandomColor;
        _tableView.backgroundView.backgroundColor = kRandomColor;
    }
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

#pragma mark - Network

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
