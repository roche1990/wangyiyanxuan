//
//  NSObject+Safe.m
//  yanxuan
//
//  Created by Hanson on 2018/3/2.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "NSObject+Safe.h"

@implementation NSObject (Safe)

+(NSString *)getSafeString:(NSString *)string{
    
    if ([string isKindOfClass:[NSString class]]) {
        
        return string;
    }
    
    NSLog(@"字符串数据有误");
    
    return [[NSString alloc] init];
}

+(NSDictionary *)getSafeDictionary:(NSDictionary *)dictionary{
    
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        
        return dictionary;
    }
    
    NSLog(@"字典数据有误");
    
    return [[NSDictionary alloc] init];
}

+(NSArray *)getSafeArray:(NSObject *)array{
    
    if ([array isKindOfClass:[NSArray class]]) {
        
        return (NSArray *)array;
    }
    
    NSLog(@"数组数据有误");
    
    return [[NSArray alloc] init];
}

@end
