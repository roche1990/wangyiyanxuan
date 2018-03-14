//
//  YXGoodsSpecServiceDotView.m
//  yanxuan
//
//  Created by Hanson on 2018/3/2.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecServiceDotView.h"
#import "UIView+Common.h"
#import <Masonry.h>

@interface YXGoodsSpecServiceDotView ()

/** <#注释#> */
@property (nonatomic, strong) UIImageView *dotImageView;
/** <#注释#> */
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation YXGoodsSpecServiceDotView

-(instancetype)init{
    
    self = [super init];
    
    if (self) {
        
        _dotImageView = [[UIImageView alloc] init];
        _dotImageView.backgroundColor = [UIColor colorWithRed:221/255.0 green:35/255.0 blue:35/255.0 alpha:1];
        [self addSubview:_dotImageView];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        [self addSubview:_titleLabel];
        
    }
    
    return self;
}

-(void)setTitle:(NSString *)title{
    
    _title = title;
    
    self.titleLabel.text = title;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [self.dotImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerY.equalTo(self);
        make.left.equalTo(self);
        make.width.height.mas_equalTo(4);
    }];
    
    [self.dotImageView cornerRadiusRoundingRect];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self.dotImageView.mas_right).offset(5);
    }];
}

@end
