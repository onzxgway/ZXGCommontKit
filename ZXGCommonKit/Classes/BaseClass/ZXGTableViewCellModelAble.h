//
//  ZXGTableViewCellModelAble.h
//  Pods
//
//  Created by 朱献国 on 2018/4/27.
//

@protocol ZXGTableViewCellModelAble <NSObject>

@required

@property (nonatomic, copy) NSString *reuseIdentifier;  // cell重用标识符

@property (nonatomic) Class cellClass;                  // cell类

@property (nonatomic) CGFloat rowHeight;                // cell行高

@end
