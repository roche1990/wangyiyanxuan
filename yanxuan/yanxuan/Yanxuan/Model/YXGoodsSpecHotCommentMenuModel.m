//
//  YXGoodsSpecHotCommentMenuModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecHotCommentMenuModel.h"

@implementation YXGoodsSpecHotCommentMenuDataModel

@end

@implementation YXGoodsSpecHotCommentMenuModel

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.goodsSpecModelType = kYXGoodsSpecModelTypeHotCommentMenu;
    }
    
    return self;
}

-(YXGoodsSpecHotCommentMenuDataModel *)goodsSpecHotCommentMenuDataModel{
    
    if (!_goodsSpecHotCommentMenuDataModel) {
        
        _goodsSpecHotCommentMenuDataModel = [[YXGoodsSpecHotCommentMenuDataModel alloc]init];
    }
    return _goodsSpecHotCommentMenuDataModel;
}

@end
