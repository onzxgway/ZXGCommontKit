//
//  ZXGSectionModel.h
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/26.
//

#import "ZXGRootModel.h"
#import "ZXGBaseTableViewCellModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZXGBaseTableViewSectionModel : ZXGRootModel

- (void)addCellModel:(ZXGBaseTableViewCellModel *)model;

- (void)addCellModels:(NSMutableArray<ZXGBaseTableViewCellModel *> *)models;

- (NSUInteger)cellModelsCount;

- (void)removeCellModel:(ZXGBaseTableViewCellModel *)model;

- (void)removeCellModelAtIndex:(NSUInteger)index;

- (void)removeAllCellModel;

- (ZXGBaseTableViewCellModel *)modelAtIndex:(NSUInteger)index;

- (NSUInteger)indexOfModel:(ZXGBaseTableViewCellModel *)anObject;

@end

NS_ASSUME_NONNULL_END
