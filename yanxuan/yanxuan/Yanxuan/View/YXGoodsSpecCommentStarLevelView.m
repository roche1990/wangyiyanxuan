//
//  YXGoodsSpecCommentStarLevelView.m
//  yanxuan
//
//  Created by Luuuo on 2018/3/3.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecCommentStarLevelView.h"

@interface YXGoodsSpecCommentStarLevelView ()

/** <#注释#> */
@property (nonatomic, strong) NSMutableArray *buttons;

@end

@implementation YXGoodsSpecCommentStarLevelView

-(instancetype)init{
    
    if (self = [super init]) {
        
        _buttons = [NSMutableArray arrayWithCapacity:5];
        
        UIButton *btn1 = [self createButtonWithX:0];
        UIButton *btn2 = [self createButtonWithX:CGRectGetMaxX(btn1.frame) + 3];
        UIButton *btn3 = [self createButtonWithX:CGRectGetMaxX(btn2.frame) + 3];
        UIButton *btn4 = [self createButtonWithX:CGRectGetMaxX(btn3.frame) + 3];
        UIButton *btn5 = [self createButtonWithX:CGRectGetMaxX(btn4.frame) + 3];
        
        [self addSubview:btn1];
        [self addSubview:btn2];
        [self addSubview:btn3];
        [self addSubview:btn4];
        [self addSubview:btn5];
        
        [_buttons addObject:btn1];
        [_buttons addObject:btn2];
        [_buttons addObject:btn3];
        [_buttons addObject:btn4];
        [_buttons addObject:btn5];
    }
    
    return self;
}

-(UIButton *)createButtonWithX:(CGFloat )x{
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(x, 0, 16, 16)];
    btn.userInteractionEnabled = NO;
    [btn setImage:[UIImage imageNamed:@"common_comment_smallstar_gray_ic"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"common_comment_smallstar_ic"] forState:UIControlStateSelected];
    return btn;
}

-(void)setStarVO:(NSInteger)starVO{
    
    _starVO = starVO;
    
    [_buttons enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        obj.selected = (idx < _starVO ? YES:NO);
    }];
}

@end
