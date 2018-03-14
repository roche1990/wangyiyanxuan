//
//  YXGoodsSpecServicePolicyModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecServicePolicyModel.h"

@implementation YXGoodsSpecServicePolicyListModel

@end

@implementation YXGoodsSpecServicePolicyModel

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.goodsSpecModelType = kYXGoodsSpecModelTypeServicePolicy;
    }
    return self;
}

-(NSMutableArray *)policyList{
    
    if (!_policyList) {
        
        _policyList = [[NSMutableArray alloc] init];
    }
    return _policyList;
}

@end
