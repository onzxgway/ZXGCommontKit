//
//  ZXGBaseTableView.h
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/26.
//

#import "ZXGRootTableView.h"
#import "ZXGBaseTableViewSectionModel.h"
#import "ZXGTableViewCellAble.h"

@interface ZXGBaseTableView : ZXGRootTableView <UITableViewDataSource, UITableViewDelegate> {
    @protected
    NSMutableArray<ZXGBaseTableViewSectionModel *> *_dataSourceArr;
    __weak UIViewController<ZXGTableViewCellDelegate> *_controller;
}

/** 数据源数组*/
@property (nonatomic, strong) NSMutableArray<ZXGBaseTableViewSectionModel *> *dataSourceArr;
@property (nonatomic, weak  ) UIViewController<ZXGTableViewCellDelegate> *controller;

@end
