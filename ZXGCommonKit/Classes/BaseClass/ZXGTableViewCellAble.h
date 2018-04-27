//
//  ZXGTableViewCellAble.h
//  Pods
//
//  Created by 朱献国 on 2018/4/27.
//


@protocol ZXGTableViewCellAble <NSObject>

@required

// 子类重写
- (void)settingModel:(id<ZXGTableViewCellModelAble>)model secModel:(ZXGBaseTableViewSectionModel *)secModel indexPath:(NSIndexPath *)indexPath;

@end
