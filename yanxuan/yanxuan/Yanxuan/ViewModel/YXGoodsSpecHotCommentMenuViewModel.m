//
//  YXGoodsSpecHotCommentMenuViewModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecHotCommentMenuViewModel.h"

@implementation YXGoodsSpecHotCommentMenuViewModel

+(YXGoodsSpecHotCommentMenuModel *)handleWithDict:(NSDictionary *)result{
    
    YXGoodsSpecHotCommentMenuModel *model = [YXGoodsSpecHotCommentMenuModel new];
    
    model.goodsSpecHotCommentMenuDataModel.commentCount = [[result objectForKey:@"commentCount"] longValue];
    if (model.goodsSpecHotCommentMenuDataModel.commentCount > 999) {
        model.goodsSpecHotCommentMenuDataModel.countName = @"用户评价(999+)";
    } else {
        model.goodsSpecHotCommentMenuDataModel.countName = [NSString stringWithFormat:@"用户评价(%ld)",model.goodsSpecHotCommentMenuDataModel.commentCount];
    }
    model.goodsSpecHotCommentMenuDataModel.percentName = [NSObject getSafeString:[result objectForKey:@"commentPercent"]];
    model.goodsSpecHotCommentMenuDataModel.percentName = [NSString stringWithFormat:@"%@好评",model.goodsSpecHotCommentMenuDataModel.percentName];
    
    return model;
}

@end
