//
//  YXGoodsCellViewModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsCellViewModel.h"
#import "DefineFile.h"

static NSString * const cellIdentifier = @"YXGoodsSpecHeaderFooterViewCellIdentifier";

@implementation YXGoodsCellViewModel

+(CGFloat)getCellHeightForRowWithModel:(YXGoodsSpecBaseModel *)model{
    
    CGFloat height = CGFLOAT_MIN;
    
    switch (model.goodsSpecModelType) {
        case kYXGoodsSpecModelTypeBanner:
            height = kScreenWidth;
            break;
        case kYXGoodsSpecModelTypeFeature:
            height = 60;
            break;
        case kYXGoodsSpecModelTypeDescript:
        {
            YXGoodsSpecDescriptModel *obj = (YXGoodsSpecDescriptModel *)model;
            height = obj.height;
        }
            break;
        case kYXGoodsSpecModelTypeSpec:
            height = 52;
            break;
        case kYXGoodsSpecModelTypeCoupon:
        {
            YXGoodsSpecCouponModel *obj = (YXGoodsSpecCouponModel *)model;
            
            if (obj.isHidden) {
                height = CGFLOAT_MIN;
            } else {
                height = 52;
            }
        }
            break;
        case kYXGoodsSpecModelTypeIntegral:
            height = 52;
            break;
        case kYXGoodsSpecModelTypeServicePolicy:
        {
            YXGoodsSpecServicePolicyModel *obj = (YXGoodsSpecServicePolicyModel *)model;
            height = obj.height + 20;
        }
            break;
        case kYXGoodsSpecModelTypeHotCommentMenu:
            height = 45;
            break;
        case kYXGoodsSpecModelTypeHotComment:
        {
            YXGoodsSpecHotCommentModel *obj = (YXGoodsSpecHotCommentModel *)model;
            height = obj.height;
        }
            break;
        case kYXGoodsSpecModelTypeHotRecomnetdation:
            height = 251;
            break;
            
        default:
            break;
    }
    
    return height;
}

+(CGFloat)getCellHeightForHeaderWithModel:(YXGoodsSpecBaseModel *)model{
    
    return CGFLOAT_MIN;
}

+(UIView *)getViewForHeaderWithModel:(YXGoodsSpecBaseModel *)model WithTableView:(UITableView *)tableView{
    
    return nil;
}

+(CGFloat)getCellHeightForFooterWithModel:(YXGoodsSpecBaseModel *)model{
    
    CGFloat height = 10.0;
    
    return height;
}

+(UIView *)getViewForFooterWithModel:(YXGoodsSpecBaseModel *)model WithTableView:(UITableView *)tableView{
    
    YXGoodsSpecHeaderFooterView *footer = (YXGoodsSpecHeaderFooterView *)[tableView dequeueReusableHeaderFooterViewWithIdentifier:cellIdentifier];
    
    if (!footer) {
        footer = [[YXGoodsSpecHeaderFooterView alloc] initWithReuseIdentifier:cellIdentifier];
    }
    
    return footer;
}

@end


