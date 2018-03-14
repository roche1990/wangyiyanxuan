//
//  YXGoodsSpecIntegralViewModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBaseViewModel.h"

#import "YXGoodsSpecIntegralModel.h"

@interface YXGoodsSpecIntegralViewModel : YXGoodsSpecBaseViewModel
+(YXGoodsSpecIntegralModel *)handleWithDict:(NSDictionary *)result;
@end
