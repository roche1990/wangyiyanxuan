//
//  YXGoodsSpecServicePolicyModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBaseModel.h"

@interface YXGoodsSpecServicePolicyListModel : NSObject
/** <#注释#> */
@property (nonatomic, copy) NSString *content;
/** <#注释#> */
@property (nonatomic, copy) NSString *title;
/** <#name#> */
@property (nonatomic, assign) CGFloat width;

@end

@interface YXGoodsSpecServicePolicyModel : YXGoodsSpecBaseModel

/** <#注释#> */
@property (nonatomic, strong) NSMutableArray<YXGoodsSpecServicePolicyListModel *> *policyList;
/** <#name#> */
@property (nonatomic, assign) CGFloat height;

@end
