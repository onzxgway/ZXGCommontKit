//
//  ZXGSectionModel.h
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/26.
//

#import "ZXGRootModel.h"
#import "EMBaseTableViewSectionModelAble.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZXGBaseTableViewSectionModel : ZXGRootModel

- (void)addCellModel:(id<EMBaseTableViewCellModelAble>)model;

- (void)addCellModels:(NSMutableArray<id<EMBaseTableViewCellModelAble>> *)models;

- (NSUInteger)cellModelsCount;

- (void)removeCellModel:(id<EMBaseTableViewCellModelAble>)model;

- (void)removeCellModelAtIndex:(NSUInteger)index;

- (void)removeAllCellModel;

- (id<EMBaseTableViewCellModelAble> _Nullable)modelAtIndex:(NSUInteger)index;

- (NSUInteger)indexOfModel:(id<EMBaseTableViewCellModelAble>)anObject;

@end

NS_ASSUME_NONNULL_END
