//
//  YXGoodsSpecServicePolicyTabCell.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecServicePolicyTabCell.h"
#import "YXGoodsSpecServicePolicyModel.h"
#import "YXGoodsSpecServicePolicyView.h"

#import "UIView+Common.h"

@interface YXGoodsSpecServicePolicyTabCell ()
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecServicePolicyView *goodsSpecServicePolicyView;
@end

@implementation YXGoodsSpecServicePolicyTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"YXGoodsSpecServicePolicyTabCell";
    //缓存中取
    YXGoodsSpecServicePolicyTabCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //创建
    if (!cell)
    {
        cell = [[YXGoodsSpecServicePolicyTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self addArrowImageView];
        
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 10, 33, 17)];
        nameLabel.text = @"服务:";
        nameLabel.font = [UIFont systemFontOfSize:14];
        nameLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1];
        [self.contentView addSubview:nameLabel];
    }
    return self;
}

-(void)setModel:(YXGoodsSpecBaseModel *)model{
    
    YXGoodsSpecServicePolicyModel *obj = (YXGoodsSpecServicePolicyModel *)model;
    
    if (!_goodsSpecServicePolicyView) {
        
        _goodsSpecServicePolicyView = [[YXGoodsSpecServicePolicyView alloc] initWithFrame:CGRectMake(15 + 33 + 10, 10, kYXGoodsSpecServiceCollectionWidth, obj.height)];
        _goodsSpecServicePolicyView.dataSource = obj.policyList;
        [self.contentView addSubview:_goodsSpecServicePolicyView];
    }
    
    [super setModel:model];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
