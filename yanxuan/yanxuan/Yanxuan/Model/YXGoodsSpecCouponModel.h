//
//  YXGoodsSpecCouponModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBaseModel.h"

@interface YXGoodsSpecCouponImageModel : NSObject
/** <#注释#> */
@property (nonatomic, assign) CGFloat width;
/** <#注释#> */
@property (nonatomic, copy) NSString *name;

@end

@interface YXGoodsSpecCouponModel : YXGoodsSpecBaseModel

/** <#注释#> */
@property (nonatomic, strong) NSMutableArray<YXGoodsSpecCouponImageModel*> *couponShortNameList;
/** <#name#> */
@property (nonatomic, assign, getter=isHidden) BOOL hidden;

@end
