//
//  YXGoodsSpecBaseModel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YXGoodsSpecModelType) {
    kYXGoodsSpecModelTypeBanner = 0,
    kYXGoodsSpecModelTypeFeature,
    kYXGoodsSpecModelTypeDescript,
    kYXGoodsSpecModelTypeSpec,
    kYXGoodsSpecModelTypeCoupon,
    kYXGoodsSpecModelTypeIntegral,
    kYXGoodsSpecModelTypeServicePolicy,
    kYXGoodsSpecModelTypeHotCommentMenu,
    kYXGoodsSpecModelTypeHotComment,
    kYXGoodsSpecModelTypeHotRecomnetdation
};

@interface YXGoodsSpecBaseModel : NSObject
/** <#name#> */
@property (nonatomic, assign) YXGoodsSpecModelType goodsSpecModelType;

@end
