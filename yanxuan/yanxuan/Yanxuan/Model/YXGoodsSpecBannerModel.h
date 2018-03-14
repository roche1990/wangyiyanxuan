//
//  YXGoodsSpecBannerModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBaseModel.h"

@interface YXGoodsSpecBannerImageModel : NSObject
/** <#注释#> */
@property (nonatomic, strong) NSString *url;

@end

@interface YXGoodsSpecBannerModel : YXGoodsSpecBaseModel

/** <#注释#> */
@property (nonatomic, strong) NSMutableArray<YXGoodsSpecBannerImageModel *> *images;

@end
