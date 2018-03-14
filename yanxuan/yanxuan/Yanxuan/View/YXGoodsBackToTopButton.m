//
//  YXGoodsBackToTopButton.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsBackToTopButton.h"

#import "DefineFile.h"

@implementation YXGoodsBackToTopButton

+(instancetype)initWithWithTarget:(id )target withAction:(SEL )action{
    
    CGFloat height = 41;
    
    YXGoodsBackToTopButton *backToTopButton = [self.class new];
    backToTopButton.frame = CGRectMake(kScreenWidth - height - 15,kScreenHeight - kYXGoodsDetailOperationBarHeight - 15 - height - kAdjustHeight, height, height);
    backToTopButton.adjustsImageWhenHighlighted = NO;
    [backToTopButton setImage:[UIImage imageNamed:@"homepage_ic_stick_nor"] forState:UIControlStateNormal];
    [backToTopButton addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return backToTopButton;
}

@end
