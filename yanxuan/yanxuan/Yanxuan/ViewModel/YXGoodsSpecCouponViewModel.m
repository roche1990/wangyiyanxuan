//
//  YXGoodsSpecCouponViewModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecCouponViewModel.h"
#import "NSObject+Common.h"

@implementation YXGoodsSpecCouponViewModel

+(YXGoodsSpecCouponModel *)handleWithDict:(NSDictionary *)result{
    
    YXGoodsSpecCouponModel *model = [YXGoodsSpecCouponModel new];
    
    [model.couponShortNameList removeAllObjects];
    
    NSArray *list = [NSObject getSafeArray:[result objectForKey:@"couponShortNameList"]];
    if ([list count]) {
        [list enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            YXGoodsSpecCouponImageModel *imageModel = [[YXGoodsSpecCouponImageModel alloc] init];
            imageModel.name = [NSObject getSafeString:obj];
            imageModel.width = [NSObject getWidthWithString:imageModel.name font:[UIFont systemFontOfSize:10]] + 10;
            [model.couponShortNameList addObject:imageModel];
        }];
    } else {
        model.hidden = YES;
    }
    
    return model;
}

@end
