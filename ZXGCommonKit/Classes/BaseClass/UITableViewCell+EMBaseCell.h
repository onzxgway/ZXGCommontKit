//
//  UITableViewCell+EMBaseCell.h
//  ZXGCommontKit
//
//  Created by 朱献国 on 2019/5/24.
//

#import <UIKit/UIKit.h>
#import "EMBaseTableViewSectionModel.h"

@interface UITableViewCell (EMBaseCell)

- (void)settingWithCellModel:(id<EMBaseTableViewCellModelAble>)cellModel sectionModel:(EMBaseTableViewSectionModel *)sectionModel atIndexPath:(NSIndexPath *)indexPath;

@end
