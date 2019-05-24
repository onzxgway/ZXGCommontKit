//
//  ZXGSectionModel.h
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/26.
//

#import "ZXGRootModel.h"
#import "ZXGTableViewCellModelAble.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZXGBaseTableViewSectionModel : ZXGRootModel

- (void)addCellModel:(id<ZXGTableViewCellModelAble>)model;

- (void)addCellModels:(NSMutableArray<id<ZXGTableViewCellModelAble>> *)models;

- (NSUInteger)cellModelsCount;

- (void)removeCellModel:(id<ZXGTableViewCellModelAble>)model;

- (void)removeCellModelAtIndex:(NSUInteger)index;

- (void)removeAllCellModel;

- (id<ZXGTableViewCellModelAble> _Nullable)modelAtIndex:(NSUInteger)index;

- (NSUInteger)indexOfModel:(id<ZXGTableViewCellModelAble>)anObject;

@end

NS_ASSUME_NONNULL_END
