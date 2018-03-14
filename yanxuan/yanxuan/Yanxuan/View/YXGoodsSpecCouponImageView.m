//
//  YXGoodsSpecCouponImageView.m
//  yanxuan
//
//  Created by Hanson on 2018/3/2.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecCouponImageView.h"

#import "NSObject+Common.h"
#import <Masonry.h>

@implementation YXGoodsSpecCouponImageView

+(void)addCouponViewTo:(UIView *)view name:(NSString *)name width:(CGFloat )width x:(CGFloat )x maxWidth:(CGFloat )maxWidth{
    
    if (!name||[name length] == 0) {
        
        return;
    }
    
    UIFont *font = [UIFont systemFontOfSize:10];
    
    if (width > maxWidth) {
        
        return;
    }
    
    YXGoodsSpecCouponImageView *goodsSpecCouponImageView = [[YXGoodsSpecCouponImageView alloc] initWithImage:[UIImage imageNamed:@"commoditydetail_coupon_ic"]];
    
    [view addSubview:goodsSpecCouponImageView];
    [goodsSpecCouponImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(18);
        make.centerY.equalTo(view);
        make.leading.equalTo(view).offset(x);
        make.width.mas_equalTo(width);
    }];
    
//    NSLog(@"width = %lf",width);
    
    // 245 169 92
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = name;
    titleLabel.textColor = [UIColor colorWithRed:245/255.0 green:169/255.0 blue:92/255.0 alpha:1];
    titleLabel.font = font;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    [goodsSpecCouponImageView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(goodsSpecCouponImageView);
    }];
    
    
}

@end
