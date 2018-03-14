//
//  YXGoodsSpecBannerViewModel.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBannerViewModel.h"
#import "NSDictionary+Common.h"

@implementation YXGoodsSpecBannerViewModel

+(YXGoodsSpecBannerModel *)handleWithDict:(NSDictionary *)result{
    
    NSDictionary *bannerResult = [NSObject getSafeDictionary:[result objectForKey:@"itemDetail"]];
    
    NSMutableArray *imageskeyList = [bannerResult.allKeys mutableCopy];
    
    [imageskeyList removeObject:@"detailHtml"];
    
    YXGoodsSpecBannerModel *model = [[YXGoodsSpecBannerModel alloc] init];
    
    [imageskeyList enumerateObjectsUsingBlock:^(NSString *key, NSUInteger idx, BOOL * _Nonnull stop) {
        
        YXGoodsSpecBannerImageModel *imageModel = [YXGoodsSpecBannerImageModel new];
        imageModel.url = [NSObject getSafeString:[bannerResult objectForKey:key]];
        [model.images addObject:imageModel];
    }];
    
    return model;
}

@end
