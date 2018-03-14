//
//  NSDictionary+Common.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "NSDictionary+Common.h"

@implementation NSDictionary (Common)

+(NSDictionary *)loadLocationJsonDataWithFileName:(NSString *)fileName{
    
    NSString *content = [NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:fileName ofType:nil] encoding:NSUTF8StringEncoding error:nil];
    return [NSJSONSerialization JSONObjectWithData:[content dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
}

@end
