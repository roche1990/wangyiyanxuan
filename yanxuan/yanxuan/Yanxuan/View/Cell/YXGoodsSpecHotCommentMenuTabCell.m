//
//  YXGoodsSpecHotCommentMenuTabCell.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecHotCommentMenuTabCell.h"
#import "YXGoodsSpecHotCommentMenuModel.h"

@implementation YXGoodsSpecHotCommentMenuTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"YXGoodsSpecHotCommentMenuTabCell";
    //缓存中取
    YXGoodsSpecHotCommentMenuTabCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //创建
    if (!cell)
    {
        cell = [[YXGoodsSpecHotCommentMenuTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addArrowImageView];
        [self showBottomLineWithType:kYXCellLineTypeShort];
        [self showCommonTitle];
        [self addArrowImageView];
        [self addRightDetailTextLabel];
    }
    return self;
}

-(void)setModel:(YXGoodsSpecBaseModel *)model{
    
    YXGoodsSpecHotCommentMenuModel *obj = (YXGoodsSpecHotCommentMenuModel *)model;
    
    self.textLabel.text = obj.goodsSpecHotCommentMenuDataModel.countName;
    self.rightDetailTextLabel.text = obj.goodsSpecHotCommentMenuDataModel.percentName;
    
    [super setModel:model];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
