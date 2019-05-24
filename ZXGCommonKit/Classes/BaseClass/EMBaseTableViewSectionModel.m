//
//  EMBaseTableViewSectionModel.m
//  ZXGCommontKit
//
//  Created by 朱献国 on 2019/5/24.
//

#import "EMBaseTableViewSectionModel.h"

@implementation EMBaseTableViewSectionModel

- (NSMutableArray<id<EMBaseTableViewCellModelAble>> *)cellModelArray {
    if (!_cellModelArray) {
        _cellModelArray = [NSMutableArray array];
    }
    return _cellModelArray;
}

@end
