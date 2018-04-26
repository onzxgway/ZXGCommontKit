//
//  ZXGSectionModel.m
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/26.
//

#import "ZXGBaseTableViewSectionModel.h"


@interface ZXGBaseTableViewSectionModel()

@end

@implementation ZXGBaseTableViewSectionModel {
    NSMutableArray<ZXGBaseTableViewCellModel *> *_sectionModels;
    //    OSSpinLock          _lock;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _sectionModels = [@[] mutableCopy];
//        _lock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)addCellModel:(ZXGBaseTableViewCellModel *)model {
    if (model) {
        [_sectionModels addObject:model];
    }
}

- (void)addCellModels:(NSMutableArray<ZXGBaseTableViewCellModel *> *)models {
    if (models) {
        [_sectionModels addObjectsFromArray:models];
    }
}

- (NSUInteger)cellModelsCount {
    return _sectionModels.count;
}

- (void)removeCellModel:(ZXGBaseTableViewCellModel *)model {
    if (model) {
        [_sectionModels removeObject:model];
    }
}

- (void)removeCellModelAtIndex:(NSUInteger)index {
    if (index < _sectionModels.count) {
        [_sectionModels removeObjectAtIndex:index];
    }
}

- (void)removeAllCellModel {
    if (_sectionModels.count > 0) {
        [_sectionModels removeAllObjects];
    }
}

- (ZXGBaseTableViewCellModel *)modelAtIndex:(NSUInteger)index {
    if (index >= _sectionModels.count) {
        return nil;
    }
    return [_sectionModels objectAtIndex:index];
}

- (NSUInteger)indexOfModel:(ZXGBaseTableViewCellModel *)anObject {
    if (!anObject) {
        return MAXFLOAT;
    }
    return [_sectionModels indexOfObject:anObject];
}

@end
