//
//  YXGoodsSpecDescriptTabCell.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecDescriptTabCell.h"
#import "YXGoodsSpecDescriptRightView.h"
#import "YXGoodsSpecDescriptModel.h"

@interface YXGoodsSpecDescriptTabCell ()

/** <#注释#> */
@property (nonatomic, strong) UILabel *nameLabel;
/** <#注释#> */
@property (nonatomic, strong) UILabel *detailLabel;
/** <#注释#> */
@property (nonatomic, strong) UILabel *priceLabel;
/** <#注释#> */
@property (nonatomic, strong) UIView *lineView;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecDescriptRightView *goodsSpecDescriptRightView;

@end

@implementation YXGoodsSpecDescriptTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"YXGoodsSpecDescriptTabCell";
    //缓存中取
    YXGoodsSpecDescriptTabCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //创建
    if (!cell)
    {
        cell = [[YXGoodsSpecDescriptTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.numberOfLines = 2;
        _nameLabel.font = [UIFont systemFontOfSize:18];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.numberOfLines = 2;
        _detailLabel.font = [UIFont systemFontOfSize:14];
        _detailLabel.textAlignment = NSTextAlignmentLeft;
        _detailLabel.textColor = [UIColor colorWithHexString:@"#666666"];
        
        _priceLabel = [[UILabel alloc] init];
        _priceLabel.font = [UIFont boldSystemFontOfSize:23];
        _priceLabel.textColor = [UIColor colorWithHexString:@"#DD2323"];
        _priceLabel.textAlignment = NSTextAlignmentLeft;
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"#DCDCDC"];
        
        _goodsSpecDescriptRightView = [[YXGoodsSpecDescriptRightView alloc] init];
        
        [_goodsSpecDescriptRightView setDidClickCommentBlock:^{
            NSLog(@"查看评论");
        }];
        
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_detailLabel];
        [self.contentView addSubview:_priceLabel];
        [self.contentView addSubview:_lineView];
        [self.contentView addSubview:_goodsSpecDescriptRightView];
        
    }
    return self;
}

-(void)setModel:(YXGoodsSpecBaseModel *)model{
    
    YXGoodsSpecDescriptModel *obj = (YXGoodsSpecDescriptModel *)model;
    
    _nameLabel.frame = CGRectMake(15, 15, obj.nameWidth, obj.nameHeight);
    _nameLabel.text = obj.name;
    
    _detailLabel.frame = CGRectMake(15, 15 + obj.nameHeight + 3, obj.detailWidth, obj.detailHeight);
    _detailLabel.text = obj.simpleDesc;
    
    _priceLabel.frame = CGRectMake(15, 15 + obj.nameHeight + obj.detailHeight + 8, obj.detailWidth, 29);
    _priceLabel.text = obj.counterPrice;
    
    _lineView.frame = CGRectMake(kScreenWidth - obj.rightButtonWidth, 15, 0.5, obj.height - 30);
    
    _goodsSpecDescriptRightView.frame = CGRectMake(kScreenWidth - obj.rightButtonWidth, 0, obj.rightButtonWidth, obj.height);
    _goodsSpecDescriptRightView.commentCount = obj.commentString;
    
    [super setModel:model];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
