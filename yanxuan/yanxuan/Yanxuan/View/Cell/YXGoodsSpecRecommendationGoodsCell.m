//
//  YXGoodsSpecRecommendationGoodsCell.m
//  yanxuan
//
//  Created by Luuuo on 2018/3/4.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecRecommendationGoodsCell.h"
#import "YXGoodsSpecRecommedationGoodsStatusView.h"

#import "UIColor+Common.h"
#import "UIView+Common.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface YXGoodsSpecRecommendationGoodsCell ()

/** <#注释#> */
@property (nonatomic, strong) UIImageView *iconImageView;
/** <#注释#> */
@property (nonatomic, strong) UILabel *nameLabel;
/** <#注释#> */
@property (nonatomic, strong) UILabel *priceLabel;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecRecommedationGoodsStatusView *goodsSpecRecommedationGoodsStatusView;

@end

@implementation YXGoodsSpecRecommendationGoodsCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        CGFloat width = 118;
        
        _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, 118)];
        _iconImageView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
        
        _goodsSpecRecommedationGoodsStatusView = [[YXGoodsSpecRecommedationGoodsStatusView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_iconImageView.frame)+5, width, 15)];
        
        _nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_goodsSpecRecommedationGoodsStatusView.frame)+5, width, 17)];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        
        _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(_nameLabel.frame)+3, width, 17)];
        _priceLabel.textColor = [UIColor colorWithHexString:@"#DD2323"];
        _priceLabel.font = [UIFont systemFontOfSize:13];
        
        [self.contentView addSubview:_iconImageView];
        [self.contentView addSubview:_goodsSpecRecommedationGoodsStatusView];
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_priceLabel];
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_priceLabel setY:CGRectGetMaxY(_nameLabel.frame)+3];
}

-(void)setModel:(YXGoodsSpecRecommedationDataModel *)model{
    
    _model = model;
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.listPicUrl]];
    _goodsSpecRecommedationGoodsStatusView.itemTagList = model.itemTagList;
    _nameLabel.text = model.name;
    _priceLabel.text = model.priceString;
    
    if (_goodsSpecRecommedationGoodsStatusView.isHidden) {
        [_nameLabel setY:CGRectGetMaxY(_iconImageView.frame)+5];
    } else {
        [_nameLabel setY:CGRectGetMaxY(_goodsSpecRecommedationGoodsStatusView.frame)+5];
    }
    [self layoutSubviews];
}

@end
