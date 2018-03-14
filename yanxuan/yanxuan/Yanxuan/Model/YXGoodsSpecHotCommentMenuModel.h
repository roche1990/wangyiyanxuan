//
//  YXGoodsSpecHotCommentMenuModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBaseModel.h"

@interface YXGoodsSpecHotCommentMenuDataModel : NSObject

/** <#注释#> */
@property (nonatomic, assign) long commentCount;
/** <#注释#> */
@property (nonatomic, copy) NSString *countName;
/** <#注释#> */
@property (nonatomic, copy) NSString *percentName;

@end

@interface YXGoodsSpecHotCommentMenuModel : YXGoodsSpecBaseModel

/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecHotCommentMenuDataModel *goodsSpecHotCommentMenuDataModel;

@end
