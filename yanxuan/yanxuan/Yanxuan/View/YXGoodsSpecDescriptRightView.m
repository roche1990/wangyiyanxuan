//
//  YXGoodsSpecDescriptRightView.m
//  yanxuan
//
//  Created by Luuuo on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecDescriptRightView.h"
#import "UIColor+Common.h"
#import "DefineFile.h"

#import <Masonry.h>

@interface YXGoodsSpecDescriptRightView ()

/** '<#注释#>' */
@property (nonatomic, strong) UILabel *commentCountLabel;
/** '<#注释#>' */
@property (nonatomic, strong) UILabel *nameLabel;
/** '<#注释#>' */
@property (nonatomic, strong) UILabel *checkCommentLabel;

@end

@implementation YXGoodsSpecDescriptRightView

-(instancetype)init{
    
    if (self = [super init]) {
        
        _commentCountLabel = [[UILabel alloc] init];
        _commentCountLabel.font = [UIFont boldSystemFontOfSize:17];
        _commentCountLabel.textColor = [UIColor colorWithHexString:@"#DD2323"];
        _commentCountLabel.textAlignment = NSTextAlignmentCenter;
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textColor = [UIColor colorWithHexString:@"#DD2323"];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textAlignment = NSTextAlignmentCenter;
        _nameLabel.text = @"用户评价";
        
        _checkCommentLabel = [[UILabel alloc] init];
        _checkCommentLabel.font = [UIFont systemFontOfSize:12];
        _checkCommentLabel.textAlignment = NSTextAlignmentCenter;
        _checkCommentLabel.textColor = [UIColor colorWithHexString:@"#222222"];
        _checkCommentLabel.text = @"查看";
        _checkCommentLabel.layer.borderWidth = 0.3f;
        _checkCommentLabel.layer.cornerRadius = 3;
        _checkCommentLabel.layer.masksToBounds = YES;
        _checkCommentLabel.layer.borderColor = [UIColor colorWithHexString:@"#222222"].CGColor;
        
        [self addSubview:_commentCountLabel];
        [self addSubview:_nameLabel];
        [self addSubview:_checkCommentLabel];
        
        KAddTapRecognizer(@"didClickComment", self);
        
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    [_nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.height.mas_equalTo(15);
        make.width.mas_equalTo(50);
    }];
    
    [_commentCountLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(_nameLabel.mas_top).offset(-2);
        make.width.equalTo(_nameLabel);
        make.height.mas_equalTo(22);
    }];
    
    [_checkCommentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(_nameLabel.mas_bottom).offset(8);
        make.width.equalTo(_nameLabel);
        make.height.mas_equalTo(18);
    }];
}

-(void)didClickComment{
    
    !_didClickCommentBlock?:_didClickCommentBlock();
}

-(void)setCommentCount:(NSString *)commentCount{
    
    _commentCount = commentCount;
    
    _commentCountLabel.text = commentCount;
}

@end
