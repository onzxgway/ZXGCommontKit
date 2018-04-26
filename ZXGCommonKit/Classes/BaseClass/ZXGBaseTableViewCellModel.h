//
//  ZXGBaseTableViewCellModel.h
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/26.
//

#import "ZXGRootModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZXGBaseTableViewCellModel : ZXGRootModel

@property (nonatomic, copy) NSString *reuseIdentifier;  //cell重用标识符

@property (nonatomic) Class cellClass; //cell类

@end

NS_ASSUME_NONNULL_END
