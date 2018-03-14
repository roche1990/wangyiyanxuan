//
//  YXGoodsSpecRecommedationGoodsStatusView.m
//  yanxuan
//
//  Created by Luuuo on 2018/3/5.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecRecommedationGoodsStatusView.h"
#import "NSObject+Common.h"
#import "UIView+Common.h"
#import "UIColor+Common.h"

@interface YXGoodsSpecRecommedationGoodsStatusView ()

/** <#注释#> */
@property (nonatomic, strong) UILabel *rightLabel;
/** <#注释#> */
@property (nonatomic, strong) UILabel *leftLabel;

@end

@implementation YXGoodsSpecRecommedationGoodsStatusView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        _rightLabel = [self createLabel];
        _leftLabel = [self createLabel];
        
        [self addSubview:_rightLabel];
        [self addSubview:_leftLabel];
    }
    
    return self;
}

-(UILabel *)createLabel{
    
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont systemFontOfSize:10];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}

// 225 160 80
// 234 122 125

-(void)setItemTagList:(NSArray<YXGoodsSpecRecommedationItemTagModel *> *)itemTagList{
    
    _itemTagList = itemTagList;
    
    _rightLabel.hidden = [itemTagList count] > 0 ? NO : YES;
    _leftLabel.hidden = [itemTagList count] > 1 ? NO : YES;
    
    self.hidden = _rightLabel.hidden;
    
    [itemTagList enumerateObjectsUsingBlock:^(YXGoodsSpecRecommedationItemTagModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (idx) {
            case 0:
            {
                _rightLabel.text = obj.name;
                _rightLabel.backgroundColor = (obj.type?[UIColor colorWithR:234 G:122 B:125]:[UIColor colorWithR:225 G:160 B:80]);
                _rightLabel.frame = CGRectMake(5, 1, [NSObject getWidthWithString:obj.name font:[UIFont systemFontOfSize:10]] + 10, 15);
                [_rightLabel cornerRadiusWithNumber:2];
            }
                break;
            case 1:
            {
                _leftLabel.text = obj.name;
                _leftLabel.backgroundColor = (obj.type?[UIColor colorWithR:234 G:122 B:125]:[UIColor colorWithR:225 G:160 B:80]);
                _leftLabel.frame = CGRectMake(CGRectGetMaxX(_rightLabel.frame)+5, 1, [NSObject getWidthWithString:obj.name font:[UIFont systemFontOfSize:10]] + 10, 15);
                [_leftLabel cornerRadiusWithNumber:2];
            }
                break;
                
            default:
                break;
        }
    }];
    
}

@end
