//
//  ZXGTableViewCellAble.h
//  Pods
//
//  Created by 朱献国 on 2018/4/27.
//


@protocol ZXGTableViewCellDelegate <NSObject>

@end

@protocol ZXGTableViewCellAble <NSObject>

@required

// 子类重写
- (void)settingModel:(id<EMBaseTableViewCellModelAble>_Nullable)model secModel:(ZXGBaseTableViewSectionModel *_Nonnull)secModel indexPath:(NSIndexPath *_Nonnull)indexPath;

@optional

@property (nonatomic, weak  , nullable) id<ZXGTableViewCellDelegate> delegate;

@end


