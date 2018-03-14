//
//  YXGoodsSpecRecommedationModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecRecommedationModel.h"

@implementation YXGoodsSpecRecommedationDataModel

+(NSDictionary *)mj_objectClassInArray
{
    return @{
             @"itemTagList" : @"YXGoodsSpecRecommedationItemTagModel"
             };
}

@end

@implementation YXGoodsSpecRecommedationModel

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.goodsSpecModelType = kYXGoodsSpecModelTypeHotRecomnetdation;
    }
    
    return self;
}

-(NSMutableArray<YXGoodsSpecRecommedationDataModel *> *)hotGoodsList{
    
    if (!_hotGoodsList) {
        
        _hotGoodsList = [[NSMutableArray alloc]init];
    }
    return _hotGoodsList;
}

-(NSMutableArray<YXGoodsSpecRecommedationDataModel *> *)recommedationList{
    
    if (!_recommedationList) {
        
        _recommedationList = [[NSMutableArray alloc]init];
    }
    return _recommedationList;
}


@end
