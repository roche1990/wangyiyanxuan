//
//  YXGoodsNavigationButton.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsNavigationButton.h"

@implementation YXGoodsNavigationButton

+(instancetype)initWithImageString:(NSString *)imageString withTarget:(id )target withAction:(SEL )action{
    
    YXGoodsNavigationButton *button = [self.class new];
    button.frame = CGRectMake(0, 6.5, 31,31);
    [button setBackgroundImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}

@end
