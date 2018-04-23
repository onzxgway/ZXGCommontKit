//
//  NSString+XXXExtension.m
//  AFNetworking
//
//  Created by 朱献国 on 2018/4/23.
//

#import "NSString+XXXExtension.h"

@implementation NSString (XXXExtension)

- (NSString *)stringByTrim {
    NSCharacterSet *set = [NSCharacterSet whitespaceAndNewlineCharacterSet];
    return [self stringByTrimmingCharactersInSet:set];
}

@end
