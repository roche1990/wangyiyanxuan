//
//  YXGoodsSpecDragToIntroductionView.m
//  yanxuan
//
//  Created by Hanson on 2018/3/6.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecDragToIntroductionView.h"

#import "DefineFile.h"
#import "UIColor+Common.h"
#import <Masonry.h>

@interface YXGoodsSpecDragToIntroductionView ()
/** <#注释#> */
@property (nonatomic, strong) UILabel *titleLabel;
/** <#注释#> */
@property (nonatomic, strong) UIImageView *arrowImageView;
/** <#name#> */
@property (nonatomic, assign) CGFloat angleNnumber;

@end

@implementation YXGoodsSpecDragToIntroductionView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor whiteColor];
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor colorWithHexString:@"#969696"];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:13];
        
        [self addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.equalTo(self);
            make.bottom.equalTo(self).offset(-15);
            make.height.mas_equalTo(12);
        }];
        
        _arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"commoditydetail_ic_details_pullup"]];
        _arrowImageView.hidden = YES;
        _arrowImageView.alpha = 0.7;
        [self addSubview:_arrowImageView];
        [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(_titleLabel.mas_bottom).offset(5).priority(750);
        }];
    }
    return self;
}

-(void)setUp:(BOOL)up{
    
    _up = up;
    
    if (self.isDragToDown) {
        
        if (_arrowImageView.isHidden) {
            _arrowImageView.hidden = NO;
        }
        
        if (up) {
            _titleLabel.text = @"上拉查看更多详情";
            
        } else {
            _titleLabel.text = @"释放查看更多详情";
            
        }
        
        
    }else{
        
        if (_arrowImageView.isHidden) {
            _arrowImageView.hidden = NO;
        }
        
        if (up) {
            _titleLabel.text = @"上拉返回顶部";
            
        } else {
            _titleLabel.text = @"释放返回顶部";
            
        }
    }
    
    [self rotateAnimation];
}

-(void)stopCheckArrowImageView{
    
    if (_offSet <= 1 && _arrowImageView.transform.a == -1) {
        
        if (_angleNnumber == 180) {
            _angleNnumber +=180;
        }
        
        [self rotateAnimation];
    }
}

-(void)rotateAnimation{
    
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(_angleNnumber * (M_PI / 180.0f));
    
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        _arrowImageView.transform = endAngle;
    } completion:^(BOOL finished) {
        
        _angleNnumber+=180;
        
        if (_angleNnumber>360) {
            _angleNnumber-=360;
        }
        
    }];
}

-(void)setOffSet:(CGFloat)offSet{
    
    _offSet = offSet;
    
//    NSLog(@"offSet = %lf",offSet);
    
    if (_dragToDown) {
        [_arrowImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_titleLabel.mas_bottom).offset(5-offSet*0.2);
        }];
    } else {
        [_arrowImageView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_titleLabel.mas_top).offset(-20+offSet*0.2);
        }];
    }
}

-(void)setDragToDown:(BOOL)dragToDown{
    
    _dragToDown = dragToDown;
    
    if (!dragToDown) {
        
        [_arrowImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(_titleLabel.mas_top).offset(-20).priority(750);
        }];
        
        [self rotateAnimation];
    }
}

@end
