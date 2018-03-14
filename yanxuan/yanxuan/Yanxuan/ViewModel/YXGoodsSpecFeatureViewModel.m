//
//  YXGoodsSpecFeatureViewModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecFeatureViewModel.h"

@implementation YXGoodsSpecFeatureViewModel

+(YXGoodsSpecFeatureModel *)handleWithDict:(NSDictionary *)result{
    
    YXGoodsSpecFeatureModel *goodsSpecFeatureModel = [[YXGoodsSpecFeatureModel alloc] init];
    
    NSArray *characteristicList = [NSObject getSafeArray:[result objectForKey:@"characteristicList"]];
    [characteristicList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        YXGoodsSpecFeatureCharacterModel *model = [YXGoodsSpecFeatureCharacterModel mj_objectWithKeyValues:obj];
        [goodsSpecFeatureModel.characteristicList addObject:model];
    }];
    
    return goodsSpecFeatureModel;
}

@end
