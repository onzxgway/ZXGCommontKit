//
//  UIViewController+Dealloc.m
//  Macro_And_Categorys
//
//  Created by 朱献国 on 2018/4/17.
//  Copyright © 2018年 feizhu. All rights reserved.
//

#import "UIViewController+Dealloc.h"
#import <objc/message.h>

@implementation UIViewController (Dealloc)

//从磁盘加载到内存的时候执行
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method method1 = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
        Method method2 = class_getInstanceMethod(self, @selector(my_dealloc));
        method_exchangeImplementations(method1, method2);
        
    });
}

- (void)my_dealloc {
    NSLog(@"☺对象 %@ 销毁了☺", NSStringFromClass(self.class));
    [self my_dealloc];
}

@end
