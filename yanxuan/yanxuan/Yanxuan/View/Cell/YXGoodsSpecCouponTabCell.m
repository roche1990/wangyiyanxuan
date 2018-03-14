//
//  YXGoodsSpecCouponTabCell.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecCouponTabCell.h"
#import "YXGoodsSpecCouponModel.h"
#import "YXGoodsSpecCouponImageView.h"

@implementation YXGoodsSpecCouponTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"YXGoodsSpecCouponTabCell";
    //缓存中取
    YXGoodsSpecCouponTabCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //创建
    if (!cell)
    {
        cell = [[YXGoodsSpecCouponTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addArrowImageView];
        [self showCommonTitle];
        [self showBottomLineWithType:kYXCellLineTypeLong];
        
    }
    return self;
}


-(void)setModel:(YXGoodsSpecBaseModel *)model{
    
    if (![self.textLabel.text length]) {
        YXGoodsSpecCouponModel *obj = (YXGoodsSpecCouponModel *)model;
        
        if (!obj.isHidden) {
            
            __block CGFloat width = 0;
            [obj.couponShortNameList enumerateObjectsUsingBlock:^(YXGoodsSpecCouponImageModel *imageModel, NSUInteger idx, BOOL * _Nonnull stop) {
                [YXGoodsSpecCouponImageView addCouponViewTo:self.contentView name:imageModel.name width:imageModel.width x:56 + width + 10*idx maxWidth:kScreenWidth - 56 - width - 10*(idx+1) - 7 -15];
                width += imageModel.width;
            }];
            
            self.textLabel.text = @"领券：";
            self.arrowImageView.hidden = NO;
            self.lineView.hidden = NO;
        } else {
            self.textLabel.text = @"";
            self.arrowImageView.hidden = YES;
            self.lineView.hidden = YES;
        }
    }
    
    [super setModel:model];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
