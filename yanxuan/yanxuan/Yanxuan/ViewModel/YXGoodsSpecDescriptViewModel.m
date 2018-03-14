//
//  YXGoodsSpecDescriptViewModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecDescriptViewModel.h"
#import "NSObject+Common.h"

#import "DefineFile.h"

@implementation YXGoodsSpecDescriptViewModel

+(YXGoodsSpecDescriptModel *)handleWithDict:(NSDictionary *)result{
    
    YXGoodsSpecDescriptModel *model = [YXGoodsSpecDescriptModel mj_objectWithKeyValues:result];
    
    NSDictionary *dict = [NSObject getSafeDictionary:[result objectForKey:@"gradientPrice"]];
    model.limitPrice = [NSObject getSafeString:[dict objectForKey:@"limitPrice"]];
    
    model.counterPrice = [NSString stringWithFormat:@"¥%@",model.counterPrice];
    model.limitPrice = [NSString stringWithFormat:@"¥%@",model.limitPrice];
    
    if (model.commentCount > 999) {
        model.commentString = @"999+";
    } else {
        model.commentString = [NSString stringWithFormat:@"%zd",model.commentCount];
    }
    
    model.rightButtonWidth = 70;
    model.nameWidth = kScreenWidth - model.rightButtonWidth - 15;
    model.nameHeight = [NSObject getHeightByWidth:model.nameWidth string:model.name font:[UIFont systemFontOfSize:18] lineSpacing:0];
    model.detailHeight = [NSObject getHeightByWidth:model.nameWidth string:model.simpleDesc font:[UIFont systemFontOfSize:14] lineSpacing:0];
    model.detailWidth = model.nameWidth;
    
    model.height = 15 + model.nameHeight + model.detailHeight + 29 + 15 + 11;
    return model;
}
@end
