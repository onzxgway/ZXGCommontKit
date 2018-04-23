//
//  NSString+XXXExtension.h
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/23.
//

#import <Foundation/Foundation.h>

@interface NSString (XXXExtension)

/**
 Trim blank characters (space and newline) in head and tail.
 去除字符串头部和尾部的空白符和换行符
 
 @return the trimmed string.
 */
- (NSString *)stringByTrim;

@end
