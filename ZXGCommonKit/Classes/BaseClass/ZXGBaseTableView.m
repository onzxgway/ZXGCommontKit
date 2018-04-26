//
//  ZXGBaseTableView.m
//  Pods
//
//  Created by 朱献国 on 2018/4/26.
//
//

#import "ZXGBaseTableView.h"

@interface ZXGBaseTableView ()

@end

@implementation ZXGBaseTableView

#pragma mark - lifeCycle
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initUI];
    }
    return self;
}

#pragma mark - createViews
#pragma mark - private
- (void)initUI {
    self.delegate = self;
    self.dataSource = self;
    _dataSourceArr = [NSMutableArray array];
}

#pragma mark - public
#pragma mark - lazyLoad

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_dataSourceArr objectAtIndex:section] cellModelsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - UITableViewDelegate

@end
