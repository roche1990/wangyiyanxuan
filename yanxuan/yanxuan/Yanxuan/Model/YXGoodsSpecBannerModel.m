//
//  YXGoodsSpecBannerModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBannerModel.h"

@implementation YXGoodsSpecBannerImageModel

@end

@implementation YXGoodsSpecBannerModel

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.goodsSpecModelType = kYXGoodsSpecModelTypeBanner;
    }
    return self;
}

-(NSMutableArray<YXGoodsSpecBannerImageModel *> *)images{
    
    if (!_images) {
        
        _images = [[NSMutableArray alloc] init];
    }
    return _images;
}


@end
