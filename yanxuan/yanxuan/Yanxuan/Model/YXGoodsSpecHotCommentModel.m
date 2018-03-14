//
//  YXGoodsSpecHotCommentModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecHotCommentModel.h"

@implementation CommentReplyVO 

@end

@implementation YXGoodsSpecHotCommentDataModel

@end

@implementation YXGoodsSpecHotCommentModel

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.goodsSpecModelType = kYXGoodsSpecModelTypeHotComment;
    }
    
    return self;
}
@end
