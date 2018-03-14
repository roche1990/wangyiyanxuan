//
//  YXGoodsSpecIntegralTabCell.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecIntegralTabCell.h"


#import "YXGoodsSpecIntegralModel.h"

@implementation YXGoodsSpecIntegralTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"YXGoodsSpecIntegralTabCell";
    //缓存中取
    YXGoodsSpecIntegralTabCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //创建
    if (!cell)
    {
        cell = [[YXGoodsSpecIntegralTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
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
    
    YXGoodsSpecIntegralModel *obj = (YXGoodsSpecIntegralModel *)model;
    
    self.textLabel.text = obj.integralString;
    
    [super setModel:model];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
