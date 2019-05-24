//
//  XGBaseTableViewController.h
//  ZXGCommontKit-BaseClassResources
//
//  Created by 朱献国 on 2019/5/24.
//

#import <UIKit/UIKit.h>

@interface XGBaseTableViewController : UIViewController
<
UITableViewDelegate,
UITableViewDataSource
> {
    @protected
    UITableView *_tableView;
}

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong, readonly) NSMutableArray<id> *dataSource;

@end
