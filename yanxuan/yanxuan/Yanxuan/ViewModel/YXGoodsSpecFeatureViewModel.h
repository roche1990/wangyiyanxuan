//
//  YXGoodsSpecFeatureViewModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBaseViewModel.h"

#import "YXGoodsSpecFeatureModel.h"

@interface YXGoodsSpecFeatureViewModel : YXGoodsSpecBaseViewModel

/** <#注释#> */
@property (nonatomic, strong) NSArray *characteristicList;

+(YXGoodsSpecFeatureModel *)handleWithDict:(NSDictionary *)result;

@end
