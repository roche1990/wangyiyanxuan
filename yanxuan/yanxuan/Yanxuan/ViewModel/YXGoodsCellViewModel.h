//
//  YXGoodsCellViewModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
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

@interface YXGoodsCellViewModel : NSObject

+(CGFloat)getCellHeightForRowWithModel:(YXGoodsSpecBaseModel *)model;
+(CGFloat)getCellHeightForHeaderWithModel:(YXGoodsSpecBaseModel *)model;
+(CGFloat)getCellHeightForFooterWithModel:(YXGoodsSpecBaseModel *)model;
+(UIView *)getViewForHeaderWithModel:(YXGoodsSpecBaseModel *)model WithTableView:(UITableView *)tableView;
+(UIView *)getViewForFooterWithModel:(YXGoodsSpecBaseModel *)model WithTableView:(UITableView *)tableView;
@end


