//
//  ZXGBaseTableViewController.h
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/26.
//

#import <UIKit/UIKit.h>
#import "ZXGBaseTableView.h"

@interface ZXGBaseTableViewController : UIViewController {
    @protected
    ZXGBaseTableView *_tableView;
    NSMutableArray *_dataSource;
}

/** 列表对象*/
@property (nonatomic, strong) ZXGBaseTableView *tableView;
/** 数据源数组*/
@property (nonatomic, strong) NSMutableArray *dataSource;


@end
