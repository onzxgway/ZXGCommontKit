//
//  UIViewController+XXXExtension.m
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/23.
//

#import "UIViewController+XXXExtension.h"
#import <objc/message.h>

@implementation UIViewController (XXXExtension)

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
    NSLog(@"☺ %@对象 销毁了 ☺", NSStringFromClass(self.class));
    [self my_dealloc];
}

@end
