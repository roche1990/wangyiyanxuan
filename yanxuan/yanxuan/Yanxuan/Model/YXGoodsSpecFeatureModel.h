//
//  YXGoodsSpecFeatureModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBaseModel.h"

@interface YXGoodsSpecFeatureCharacterModel : NSObject
/** <#注释#> */
@property (nonatomic, copy) NSString *picUrl;
/** <#注释#> */
@property (nonatomic, strong) NSArray *simpleDescList;

@end

@interface YXGoodsSpecFeatureModel : YXGoodsSpecBaseModel
/** <#注释#> */
@property (nonatomic, strong) NSMutableArray *characteristicList;

@end
