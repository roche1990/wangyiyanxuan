//
//  YXGoodsSpecRecommedationViewModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecRecommedationViewModel.h"

@implementation YXGoodsSpecRecommedationViewModel

+(YXGoodsSpecRecommedationModel *)handleWithDict:(NSDictionary *)result{
    
    YXGoodsSpecRecommedationModel *model = [YXGoodsSpecRecommedationModel new];
    
    NSDictionary *data = [NSObject getSafeDictionary:[result objectForKey:@"data"]];
    
    NSArray *items = [NSObject getSafeArray:[data objectForKey:@"items"]];
    
    [model.recommedationList removeAllObjects];
    
    [items enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        YXGoodsSpecRecommedationDataModel *goodsSpecRecommedationDataModel = [YXGoodsSpecRecommedationDataModel mj_objectWithKeyValues:obj];
        
        goodsSpecRecommedationDataModel.priceString = [NSString stringWithFormat:@"¥%zd",goodsSpecRecommedationDataModel.retailPrice];
        
        [model.recommedationList addObject:goodsSpecRecommedationDataModel];
        
    }];
    
    [model.recommedationList enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(YXGoodsSpecRecommedationDataModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [model.hotGoodsList addObject:obj];
    }];
    
    return model;
}

@end
