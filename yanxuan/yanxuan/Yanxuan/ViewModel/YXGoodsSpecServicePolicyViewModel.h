//
//  YXGoodsSpecServicePolicyViewModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBaseViewModel.h"

#import "YXGoodsSpecServicePolicyModel.h"

@interface YXGoodsSpecServicePolicyViewModel : YXGoodsSpecBaseViewModel
+(YXGoodsSpecServicePolicyModel *)handleWithDict:(NSDictionary *)result;
@end
