//
//  XGBaseTableViewController.m
//  ZXGCommontKit
//
//  Created by 朱献国 on 2019/5/24.
//

#import "EMBaseTableViewController.h"
#import <Masonry.h>

@interface EMBaseTableViewController ()

@property (nonatomic, strong) NSMutableArray<id<EMBaseTableViewSectionModelAble>> *dataSource;

@end

@implementation EMBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self layoutTableView];
}

- (void)layoutTableView {
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (@available(iOS 11.0, *)) {
        make.right.mas_equalTo(self.view.mas_safeAreaLayoutGuideRight);
        make.left.mas_equalTo(self.view.mas_safeAreaLayoutGuideLeft);
        make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.bottom.mas_equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        }
        else {
            make.right.mas_equalTo(self.view.mas_right);
            make.left.mas_equalTo(self.view.mas_left);
            make.top.mas_equalTo(self.view.mas_top);
            make.bottom.mas_equalTo(self.view.mas_bottom);
        }
    }];
    
}

#pragma mark - SubClass Override
- (UITableViewStyle)tableViewStyle {
    return UITableViewStylePlain;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    EMBaseTableViewSectionModel *secModel = [self.dataSource objectAtIndex:section];
    return secModel.cellModelArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //
    EMBaseTableViewSectionModel *secModel = [self.dataSource objectAtIndex:indexPath.section];
    id<EMBaseTableViewCellModelAble> cellModel = [secModel.cellModelArray objectAtIndex:indexPath.row];
     NSAssert([cellModel conformsToProtocol:@protocol(EMBaseTableViewCellModelAble)], @"[UITableViewCell的model需要遵守 EMBaseTableViewCellModelAble协议!!!]");
//    NSAssert(cellModel.cellClass, @"[EMBaseTableViewSectionModel 的 cellClass属性的值不能为nil]");
    if (!cellModel.cellClass) {
        cellModel.cellClass = UITableViewCell.class;
    }
    NSString *reuseIdentifier = NSStringFromClass(cellModel.cellClass);
    EMBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        id tableViewCell = [[cellModel.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
//        NSAssert([tableViewCell isKindOfClass:EMBaseTableViewCell.class], @"[cell 必须继承自 EMBaseTableViewCell]");
        cell = (EMBaseTableViewCell *)tableViewCell;
    }
    
    [cell settingWithCellModel:cellModel sectionModel:secModel atIndexPath:indexPath];
    
    return cell;
}

#pragma mark - Table view delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    EMBaseTableViewSectionModel *secModel = [self.dataSource objectAtIndex:indexPath.section];
    id<EMBaseTableViewCellModelAble> cellModel = [secModel.cellModelArray objectAtIndex:indexPath.row];
    return cellModel.rowHeight <= 0 ? 44.f : cellModel.rowHeight;
}

#pragma mark - Lazy Load

- (UITableView *)tableView {
    if (!_tableView) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:[self tableViewStyle]];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.showsHorizontalScrollIndicator = NO;
//        [tableView registerClass:UITableViewCell.class forCellReuseIdentifier:NSStringFromClass(UITableViewCell.class)];
        //        [tableView registerClass:JZEClassOrderReadyTableViewCell.class forCellReuseIdentifier:NSStringFromClass(JZEClassOrderReadyTableViewCell.class)];
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //        tableView.backgroundColor = JZ_KMainColor;
        tableView.sectionHeaderHeight = 0.f;
        tableView.sectionFooterHeight = 10.f;
        if (@available(iOS 11.0, *)) {
            tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
        tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, CGFLOAT_MIN)];
        
        _tableView = tableView;
    }
    return _tableView;
}

- (NSMutableArray<id<EMBaseTableViewSectionModelAble>> *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
