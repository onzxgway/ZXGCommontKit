//
//  EMBaseTableViewSectionModelAble.h
//  ZXGCommontKit
//
//  Created by 朱献国 on 2019/5/24.
//

#import <Foundation/Foundation.h>


@protocol EMBaseTableViewCellModelAble <NSObject>

@required

@property (nonatomic) Class cellClass;                  // cell类 cell重用标识符

@property (nonatomic) CGFloat rowHeight;                // cell行高

@end


@protocol EMBaseTableViewSectionModelAble <NSObject>

@required

@property (nonatomic, strong) NSMutableArray<id<EMBaseTableViewCellModelAble>> *cellModelArray;

@end
