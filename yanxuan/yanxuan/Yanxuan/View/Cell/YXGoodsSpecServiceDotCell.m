//
//  YXGoodsSpecServiceDotCell.m
//  yanxuan
//
//  Created by Hanson on 2018/3/2.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecServiceDotCell.h"
#import "YXGoodsSpecServiceDotView.h"

@interface YXGoodsSpecServiceDotCell ()
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecServiceDotView *goodsSpecServiceDotView;



@end

@implementation YXGoodsSpecServiceDotCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        _goodsSpecServiceDotView = [[YXGoodsSpecServiceDotView alloc] init];
        [self.contentView addSubview:_goodsSpecServiceDotView];
    }
    return self;
}

-(void)setModel:(YXGoodsSpecServicePolicyListModel *)model{
    
    _model = model;
    
    _goodsSpecServiceDotView.title = model.title;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    _goodsSpecServiceDotView.frame = self.contentView.bounds;
}

@end
