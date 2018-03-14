//
//  YXGoodsSpecHotCommentViewModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBaseViewModel.h"

#import "YXGoodsSpecHotCommentModel.h"

@interface YXGoodsSpecHotCommentViewModel : YXGoodsSpecBaseViewModel
+(YXGoodsSpecHotCommentModel *)handleWithDict:(NSDictionary *)result;
@end
