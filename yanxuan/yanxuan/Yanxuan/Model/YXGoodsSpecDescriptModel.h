//
//  YXGoodsSpecDescriptModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBaseModel.h"

@interface YXGoodsSpecDescriptModel : YXGoodsSpecBaseModel

/** <#name#> */
@property (nonatomic, assign) CGFloat height;
/** <#name#> */
@property (nonatomic, assign) CGFloat rightButtonWidth;
/** <#name#> */
@property (nonatomic, assign) CGFloat nameHeight;
/** <#name#> */
@property (nonatomic, assign) CGFloat nameWidth;
/** <#name#> */
@property (nonatomic, assign) CGFloat detailHeight;
/** <#name#> */
@property (nonatomic, assign) CGFloat detailWidth;
/** <#name#> */
@property (nonatomic, copy) NSString *counterPrice;
/** <#name#> */
@property (nonatomic, copy) NSString *limitPrice;
/** <#name#> */
@property (nonatomic, copy) NSString *name;
/** <#name#> */
@property (nonatomic, copy) NSString *simpleDesc;
/** <#name#> */
@property (nonatomic, assign) NSUInteger commentCount;
/** <#注释#> */
@property (nonatomic, copy) NSString *commentString;

@end
