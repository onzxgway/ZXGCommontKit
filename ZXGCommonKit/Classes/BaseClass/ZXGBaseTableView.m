//
//  ZXGBaseTableView.m
//  Pods
//
//  Created by 朱献国 on 2018/4/26.
//
//

#import "ZXGBaseTableView.h"
#import "ZXGBaseTableViewSectionModel.h"
#import "ZXGBaseTableViewCell.h"

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
    ZXGBaseTableViewSectionModel *sectionModel = [_dataSourceArr objectAtIndex:indexPath.section];
    ZXGBaseTableViewCellModel *model = [sectionModel modelAtIndex:indexPath.row];
    if (!model.cellClass) {
        NSAssert(NO, @"[<cellClass> 不能为空]");
    }
    ZXGBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:model.reuseIdentifier];
    if (!cell) {
        cell = [(ZXGBaseTableViewCell *)[model.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:model.reuseIdentifier];
    }
    [cell settingModel:model secModel:sectionModel indexPath:indexPath];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_dataSourceArr.count ==0) return 0;
    
    ZXGBaseTableViewSectionModel *sectionModel = [_dataSourceArr objectAtIndex:indexPath.section];
    ZXGBaseTableViewCellModel *model = [sectionModel modelAtIndex:indexPath.row];
    return model.rowHeight <= 0 ? 44 : model.rowHeight;
}

@end
