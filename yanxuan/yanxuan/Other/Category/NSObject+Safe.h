//
//  NSObject+Safe.h
//  yanxuan
//
//  Created by Hanson on 2018/3/2.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Safe)

+(NSString *)getSafeString:(NSString *)string;
+(NSDictionary *)getSafeDictionary:(NSDictionary *)dictionary;
+(NSArray *)getSafeArray:(NSObject *)array;

@end
