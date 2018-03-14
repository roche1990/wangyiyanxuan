//
//  YXGoodsSpecRecommendationTabCell.h
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBaseCell.h"

@interface YXGoodsSpecRecommendationTabCell : YXGoodsSpecBaseCell

/** <#注释#> */
@property (nonatomic, copy) void(^didClickGoodsWithRecommendationTabCellBlock) (NSInteger);

@end
