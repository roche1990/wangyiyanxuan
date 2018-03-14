//
//  YXGoodsSpecIntegralViewModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecIntegralViewModel.h"

@implementation YXGoodsSpecIntegralViewModel

+(YXGoodsSpecIntegralModel *)handleWithDict:(NSDictionary *)result{
    
    YXGoodsSpecIntegralModel *model = [[YXGoodsSpecIntegralModel alloc] init];
    
    double price = [[result objectForKey:@"counterPrice"] doubleValue];
    
    model.integralString = [NSString stringWithFormat:@"购买：购买最高得%.0lf积分",price/10];
    
    return model;
}

@end
