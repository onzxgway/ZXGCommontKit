//
//  ZXGBaseTableViewCell.h
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/26.
//

#import "ZXGRootTableViewCell.h"
#import "ZXGBaseTableViewSectionModel.h"

@interface ZXGBaseTableViewCell : ZXGRootTableViewCell

// 子类重写
- (void)settingModel:(id<ZXGTableViewCellModelAble>)model secModel:(ZXGBaseTableViewSectionModel *)secModel indexPath:(NSIndexPath *)indexPath;

@end
