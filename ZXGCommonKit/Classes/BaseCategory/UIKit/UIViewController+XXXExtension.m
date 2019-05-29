//
//  UIViewController+XXXExtension.m
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/23.
//

#import "UIViewController+XXXExtension.h"
#import <objc/message.h>

@implementation UIViewController (XXXExtension)

//从磁盘加载到内存的时候执行  在main函数之前
+ (void)load {
    
    // 单例原理：通过判断静态区的long类型的变量，当为零的时候，执行block，非零的时候，不执行block。
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 这里的代码永远只可能执行一次，因为一旦执行block，onceToken的值就会变为非零。
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
