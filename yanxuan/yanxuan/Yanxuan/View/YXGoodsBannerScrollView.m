//
//  YXGoodsBannerScrollView.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsBannerScrollView.h"
#import "DefineFile.h"
#import "UIColor+Common.h"

#import <SDWebImage/UIImageView+WebCache.h>

@implementation YXGoodsBannerScrollView

-(void)setBannerModel:(YXGoodsSpecBannerModel *)bannerModel{
    
    _bannerModel = bannerModel;
    
    [bannerModel.images enumerateObjectsUsingBlock:^(YXGoodsSpecBannerImageModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
        NSURL *url = [NSURL URLWithString:obj.url];
        [imageView sd_setImageWithURL:url];
        [self addSubview:imageView];
        imageView.frame = CGRectMake(idx * kScreenWidth, 0, kScreenWidth, kScreenWidth);
    }];
}

@end
