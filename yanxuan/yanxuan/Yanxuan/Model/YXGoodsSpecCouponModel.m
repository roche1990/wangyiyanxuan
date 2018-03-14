//
//  YXGoodsSpecCouponModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecCouponModel.h"

@implementation YXGoodsSpecCouponImageModel

@end

@implementation YXGoodsSpecCouponModel

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.goodsSpecModelType = kYXGoodsSpecModelTypeCoupon;
    }
    return self;
}

-(NSMutableArray *)couponShortNameList{
    
    if (!_couponShortNameList) {
        
        _couponShortNameList = [[NSMutableArray alloc] init];
    }
    return _couponShortNameList;
}

@end
