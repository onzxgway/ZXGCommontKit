//
//  EMBaseTableViewSectionModel.h
//  ZXGCommontKit
//
//  Created by 朱献国 on 2019/5/24.
//

#import <Foundation/Foundation.h>
#import "EMBaseTableViewSectionModelAble.h"

@interface EMBaseTableViewSectionModel : NSObject <EMBaseTableViewSectionModelAble>

@property (nonatomic, strong) NSMutableArray<id<EMBaseTableViewCellModelAble>> *cellModelArray;

@end
