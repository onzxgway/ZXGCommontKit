//
//  XGBaseTableViewController.m
//  ZXGCommontKit-BaseClassResources
//
//  Created by 朱献国 on 2019/5/24.
//

#import "XGBaseTableViewController.h"
#import <Masonry.h>

@interface XGBaseTableViewController ()

@property (nonatomic, strong) NSMutableArray<id> *dataSource;

@end

@implementation XGBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    //    if (!cell) {
    //        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
    //    }
    //    BaseModel *baseModel = self.datas[indexPath.row];
    //    cell.textLabel.text = baseModel.titleName;
    //
    //    return cell;
    return nil;
}

#pragma mark - Table view delegate


#pragma mark - Lazy Load

- (UITableView *)tableView {
    if (!_tableView) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.showsVerticalScrollIndicator = NO;
        tableView.showsHorizontalScrollIndicator = NO;
        //        [tableView registerClass:JZEClassOrderDoneTableViewCell.class forCellReuseIdentifier:NSStringFromClass(JZEClassOrderDoneTableViewCell.class)];
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

- (NSMutableArray<id> *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

@end
