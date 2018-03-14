//
//  YXGoodsSpecFeatureModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecFeatureModel.h"

@implementation YXGoodsSpecFeatureCharacterModel

@end

@implementation YXGoodsSpecFeatureModel

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.goodsSpecModelType = kYXGoodsSpecModelTypeFeature;
    }
    
    return self;
}

-(NSMutableArray *)characteristicList{
    
    if (!_characteristicList) {
        
        _characteristicList = [[NSMutableArray alloc] init];
    }
    
    return _characteristicList;
}

@end
