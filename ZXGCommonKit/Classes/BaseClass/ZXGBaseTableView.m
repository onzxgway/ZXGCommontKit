//
//  ZXGBaseTableView.m
//  Pods
//
//  Created by 朱献国 on 2018/4/26.
//
//

#import "ZXGBaseTableView.h"
#import "ZXGBaseTableViewSectionModel.h"
#import "ZXGTableViewCellAble.h"
#import "UIView+XXXExtension.h"

@interface ZXGBaseTableView ()

@end

@implementation ZXGBaseTableView

#pragma mark - lifeCycle
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if (self) {
        [self initUI];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initUI];
    }
    return self;
}

#pragma mark - createViews
#pragma mark - private
- (void)initUI {
    self.delegate = self;
    self.dataSource = self;
    _dataSourceArr = [NSMutableArray array];
}

#pragma mark - public
#pragma mark - lazyLoad

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _dataSourceArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[_dataSourceArr objectAtIndex:section] cellModelsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZXGBaseTableViewSectionModel *sectionModel = [_dataSourceArr objectAtIndex:indexPath.section];
    id<ZXGTableViewCellModelAble> model = [sectionModel modelAtIndex:indexPath.row];
    if (!model.cellClass) {
        NSAssert(NO, @"[<cellClass> 不能为空]");
    }
    UITableViewCell<ZXGTableViewCellAble> *cell = [tableView dequeueReusableCellWithIdentifier:model.reuseIdentifier];
    if (!cell) {
        cell = [(UITableViewCell<ZXGTableViewCellAble> *)[model.cellClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:model.reuseIdentifier];
        cell.delegate = _controller;
    }
    [cell settingModel:model secModel:sectionModel indexPath:indexPath];
    return cell;
}

// + (BOOL) getVariableWithClass:(Class) myClass varName:(NSString *)name {
//     unsigned int outCount, i;
//     Ivar *ivars = class_copyIvarList(myClass, &outCount);
//     for (i = 0; i < outCount; i++) {
//         Ivar property = ivars[i];
//         NSString *keyName = [NSString stringWithCString:ivar_getName(property) encoding:NSUTF8StringEncoding];
//         keyName = [keyName stringByReplacingOccurrencesOfString:@"_" withString:@""];
//         if ([keyName isEqualToString:name]) {
//             return YES;
//         }
//     }
//     return NO;
// }

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_dataSourceArr.count == 0) return 0;
    
    ZXGBaseTableViewSectionModel *sectionModel = [_dataSourceArr objectAtIndex:indexPath.section];
    id<ZXGTableViewCellModelAble> model = [sectionModel modelAtIndex:indexPath.row];
    return model.rowHeight <= 0 ? 44 : model.rowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    ZXGBaseTableViewSectionModel *sectionModel = [_dataSourceArr objectAtIndex:indexPath.section];
//    id<ZXGTableViewCellModelAble> model = [sectionModel modelAtIndex:indexPath.row];
    
    
}

@end
