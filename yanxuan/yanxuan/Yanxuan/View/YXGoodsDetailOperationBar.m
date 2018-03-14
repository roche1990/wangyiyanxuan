//
//  YXGoodsDetailOperationBar.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsDetailOperationBar.h"

#import "DefineFile.h"
#import "UIColor+Common.h"
#import "UIView+AddSubViews.h"

#import <Masonry.h>

@implementation YXGoodsDetailOperationBar

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self settingSubViews];
        
    }
    return self;
}

-(void)settingSubViews{
    
    CGFloat width = kScreenWidth / 7.0;
    
    UIButton *serviceButton = [self createButtonWithImageString:@"commoditydetail_ic_details_service_nor" WithTitle:nil];
    
    [serviceButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.bottom.equalTo(self);
        make.width.mas_equalTo(width);
    }];
    [serviceButton addDividingLineWithDirectionType:kYXDividingLineTypeRight];
    
    UIButton *cartButton = [self createButtonWithImageString:@"commoditydetail_ic_menu_shoping_nor" WithTitle:nil];
    [cartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.leading.equalTo(serviceButton.mas_trailing);
        make.width.mas_equalTo(width);
    }];
    [cartButton addDividingLineWithDirectionType:kYXDividingLineTypeRight];
    
    UIButton *favirateButton = [self createButtonWithImageString:@"commoditydetail_ar_tabbar_ic_collect" WithTitle:nil];
    [favirateButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.leading.equalTo(cartButton.mas_trailing);
        make.width.mas_equalTo(width);
    }];
    [favirateButton addDividingLineWithDirectionType:kYXDividingLineTypeRight];
    
    UIButton *buyButton = [self createButtonWithImageString:nil WithTitle:@"立即购买"];
    [buyButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self);
        make.leading.equalTo(favirateButton.mas_trailing);
        make.width.mas_equalTo(width*2.0);
    }];
    
    UIButton *addToCartButton = [self createButtonWithImageString:nil WithTitle:@"加入购物车"];
    addToCartButton.backgroundColor = [UIColor colorWithR:180.0 G:40.0 B:45.0];
    [addToCartButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.trailing.equalTo(self);
        make.leading.equalTo(buyButton.mas_trailing);
    }];
    
    [self addDividingLineWithDirectionType:kYXDividingLineTypeTop];
}

-(UIButton *)createButtonWithImageString:(NSString *)imageString WithTitle:(NSString *)title{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (imageString&&[imageString length] > 0) {
        [button setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
    }
    if (title&&[title length] > 0) {
        [button setTitle:title forState:UIControlStateNormal];
        [button.titleLabel setFont:[UIFont systemFontOfSize:14]];
    }
    [self addSubview:button];
    return button;
}

@end
