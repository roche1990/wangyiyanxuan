//
//  YXGoodsSpecFeatureCellView.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecFeatureCellView.h"
#import "DefineFile.h"

#import "UIView+Common.h"
#import "UIColor+Common.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface YXGoodsSpecFeatureCellView ()

/** <#注释#> */
@property (nonatomic, strong) UIImageView *imageView;
/** <#注释#> */
@property (nonatomic, strong) UILabel *topLabel;
/** <#注释#> */
@property (nonatomic, strong) UILabel *bottomLabel;

@end

@implementation YXGoodsSpecFeatureCellView

-(instancetype)init{
    
    if (self = [super init]) {
        
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
        _topLabel = [self createLabel];
        _bottomLabel = [self createLabel];
        
        [self addSubview:_imageView];
        [self addSubview:_topLabel];
        [self addSubview:_bottomLabel];
    }
    
    return self;
}

-(UILabel *)createLabel{
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:13];
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _imageView.frame = CGRectMake(0, 0, 36, 36);
    _topLabel.frame = CGRectMake((deviceModel_5s?35:42), 0, 57.5, 17);
    _bottomLabel.frame = CGRectMake((deviceModel_5s?35:42), 19, 57.5, 17);
    
    [_imageView cornerRadiusRoundingRect];
}

-(void)setModel:(YXGoodsSpecFeatureCharacterModel *)model{
    
    _model = model;
    
    NSURL *imageUrl = [NSURL URLWithString:model.picUrl];
    [_imageView sd_setImageWithURL:imageUrl];
    
    [model.simpleDescList enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx == 0) {
            _topLabel.text = obj;
        } else {
            _bottomLabel.text = obj;
        }
    }];
}

@end
