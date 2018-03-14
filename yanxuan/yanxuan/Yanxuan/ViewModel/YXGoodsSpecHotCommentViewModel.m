//
//  YXGoodsSpecHotCommentViewModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecHotCommentViewModel.h"
#import "DefineFile.h"
#import "NSObject+Common.h"
#import "NSDate+Convert.h"

@implementation YXGoodsSpecHotCommentViewModel

+(YXGoodsSpecHotCommentModel *)handleWithDict:(NSDictionary *)result{
    
    NSArray *comments = [NSObject getSafeArray:[result objectForKey:@"comments"]];
    
    YXGoodsSpecHotCommentModel *model = [YXGoodsSpecHotCommentModel new];
    
    model.goodsSpecHotCommentDataModel = [YXGoodsSpecHotCommentDataModel mj_objectWithKeyValues:comments.firstObject];
    
    if (model.goodsSpecHotCommentDataModel.commentReplyVO) {
        model.goodsSpecHotCommentDataModel.commentReplyVO.replyerName = @"小选回复：";
    }
    model.goodsSpecHotCommentDataModel.createTimeString = [NSDate dateYTomWithTimeStamp:model.goodsSpecHotCommentDataModel.createTime];
    
    model.goodsSpecHotCommentDataModel.starVO = arc4random() % 6;
    
    if (model.goodsSpecHotCommentDataModel.starVO < 3) {
        model.goodsSpecHotCommentDataModel.starVO = 3;
    }
    
    __block NSString *skuString = @"";
    [model.goodsSpecHotCommentDataModel.skuInfo enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        NSArray *skuArray = [obj componentsSeparatedByString:@":"];
        if (idx == 0) {
            skuString = [skuString stringByAppendingString:skuArray.lastObject];
        } else {
            skuString = [skuString stringByAppendingString:[NSString stringWithFormat:@"; %@",skuArray.lastObject]];
        }
    }];
    
//    NSLog(@"skuString = %@",skuString);
    model.goodsSpecHotCommentDataModel.skuString = skuString;
    
    CGFloat x = 15;
    CGFloat commonWidth = kScreenWidth - 15*2;
    
    model.goodsSpecHotCommentDataModel.iconFrame = CGRectMake(x, 16, 32, 32);
    model.goodsSpecHotCommentDataModel.nameFrame = CGRectMake(CGRectGetMaxX(model.goodsSpecHotCommentDataModel.iconFrame) + 8, 23.5, 45, 17);
    model.goodsSpecHotCommentDataModel.levelFrame = CGRectMake(CGRectGetMaxX(model.goodsSpecHotCommentDataModel.nameFrame) + 5, 25, 14, 14);
    model.goodsSpecHotCommentDataModel.dateFrame = CGRectMake(kScreenWidth - 110 - 15, 25, 110, 14.5);
    model.goodsSpecHotCommentDataModel.starFrame = CGRectMake(x, CGRectGetMaxY(model.goodsSpecHotCommentDataModel.iconFrame) + 10, commonWidth, 16);
    model.goodsSpecHotCommentDataModel.commentFrame = CGRectMake(x, CGRectGetMaxY(model.goodsSpecHotCommentDataModel.starFrame) + 10, commonWidth, [NSObject getHeightByWidth:commonWidth string:model.goodsSpecHotCommentDataModel.content font:[UIFont systemFontOfSize:13] lineSpacing:3]);
    
    if ([model.goodsSpecHotCommentDataModel.picList count]) {
        model.goodsSpecHotCommentDataModel.commentImagesFrame = CGRectMake(x, CGRectGetMaxY(model.goodsSpecHotCommentDataModel.commentFrame) + 10, commonWidth, kYXGoodsSpecHotCommentImagesHeight);
    } else {
        model.goodsSpecHotCommentDataModel.commentImagesFrame = CGRectMake(x, CGRectGetMaxY(model.goodsSpecHotCommentDataModel.commentFrame), commonWidth, CGFLOAT_MIN);
    }
    model.goodsSpecHotCommentDataModel.sizeFrame = CGRectMake(x, CGRectGetMaxY(model.goodsSpecHotCommentDataModel.commentImagesFrame) + 10, commonWidth, 15);
    if (model.goodsSpecHotCommentDataModel.commentReplyVO) {
        model.goodsSpecHotCommentDataModel.replyFrame = CGRectMake(x, CGRectGetMaxY(model.goodsSpecHotCommentDataModel.sizeFrame) + 10, commonWidth, 56.5);
        model.height = CGRectGetMaxY(model.goodsSpecHotCommentDataModel.replyFrame) + 20;
    } else {
        model.goodsSpecHotCommentDataModel.replyFrame = CGRectMake(x, CGRectGetMaxY(model.goodsSpecHotCommentDataModel.sizeFrame) + 10, commonWidth, CGFLOAT_MIN);
        model.height = CGRectGetMaxY(model.goodsSpecHotCommentDataModel.sizeFrame) + 20;
    }
    
    return model;
}

@end
