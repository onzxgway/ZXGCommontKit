//
//  NSDictionary+Log.m
//  ZXGCommontKit
//
//  Created by 朱献国 on 2018/5/5.
//

#import "NSDictionary+Log.h"

@implementation NSArray (Log)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"[\n"];
    
    // 遍历数组的所有元素
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [strM appendFormat:@"\t%@,\n", obj];
    }];
    
    [strM appendString:@"]"];
    
    // 查出最后一个,的范围
    NSRange range = [strM rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length != 0) {
        // 删掉最后一个,
        [strM deleteCharactersInRange:range];
    }
    
    return strM.copy;
    
}

@end

@implementation NSDictionary (Log)

- (NSString *)descriptionWithLocale:(id)locale {
    NSMutableString *strM = [NSMutableString stringWithString:@"{\n"];
    
    // 遍历字典的所有键值对
    [self enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        [strM appendFormat:@"\t%@ = %@,\n", key, obj];
    }];
    
    [strM appendString:@"}\n"];
    
    // 查出最后一个,的范围
    NSRange range = [strM rangeOfString:@"," options:NSBackwardsSearch];
    if (range.length != 0) {
        // 删掉最后一个,
        [strM deleteCharactersInRange:range];
    }
    
    return strM.copy;
    
}

@end

@implementation NSSet (Log)

@end
