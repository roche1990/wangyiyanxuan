//
//  YXGoodsViewModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/7.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "HttpRequest.h"

#import "YXGoodsSpecBannerViewModel.h"
#import "YXGoodsSpecFeatureViewModel.h"
#import "YXGoodsSpecDescriptViewModel.h"
#import "YXGoodsSpecSpecViewModel.h"
#import "YXGoodsSpecCouponViewModel.h"
#import "YXGoodsSpecIntegralViewModel.h"
#import "YXGoodsSpecServicePolicyViewModel.h"
#import "YXGoodsSpecHotCommentMenuViewModel.h"
#import "YXGoodsSpecHotCommentViewModel.h"
#import "YXGoodsSpecRecommedationViewModel.h"

#import "YXGoodsSpecHeaderFooterView.h"

typedef void (^loadGoodsDataSuccess)(NSArray *dataList);

@interface YXGoodsViewModel : NSObject

-(void)loadDataWithId:(NSInteger )goods_id finishBlock:(loadGoodsDataSuccess)finishBlock;

@end

@interface YXGoodsCellViewHandleModel : NSObject

/** <#注释#> */
@property (nonatomic, strong) NSString *handleObj;
/** <#注释#> */
@property (nonatomic, assign) Class className;
/** <#注释#> */
@property (nonatomic, strong) NSDictionary *dictionary;

-(instancetype)initWithObjString:(NSObject *)obj class:(Class )className dictionary:(NSDictionary *)dictionary;

@end
