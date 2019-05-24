//
//  XGBaseTableViewController.h
//  ZXGCommontKit
//
//  Created by 朱献国 on 2019/5/24.
//

#import <UIKit/UIKit.h>
#import "EMBaseTableViewCell.h"
#import "EMBaseTableViewSectionModel.h"

@interface EMBaseTableViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
> {
    @protected
    UITableView *_tableView;
}

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong, readonly) NSMutableArray<id<EMBaseTableViewSectionModelAble>> *dataSource;

#pragma mark - SubClass Override
- (UITableViewStyle)tableViewStyle;
- (void)layoutTableView;

@end
