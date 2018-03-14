//
//  YXGoodsSpecHotCommentImageCell.m
//  yanxuan
//
//  Created by Luuuo on 2018/3/4.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecHotCommentImageCell.h"
#import "UIColor+Common.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface YXGoodsSpecHotCommentImageCell ()

/** <#注释#> */
@property (nonatomic, strong) UIImageView *commentImageView;

@end


@implementation YXGoodsSpecHotCommentImageCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        _commentImageView = [[UIImageView alloc] init];
        _commentImageView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
        _commentImageView.frame = self.contentView.bounds;
        
        [self.contentView addSubview:_commentImageView];
        
    }
    return self;
}

-(void)setImageString:(NSString *)imageString{
    
    _imageString = imageString;
    
    [_commentImageView sd_setImageWithURL:[NSURL URLWithString:imageString]];
}

@end
