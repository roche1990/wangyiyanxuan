//
//  YXGoodsSpecHotCommentTabCell.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecHotCommentTabCell.h"
#import "YXGoodsSpecCommentStarLevelView.h"
#import "YXGoodsSpecCommentImagesView.h"

#import "UILabel+Common.h"
#import "UIView+Common.h"
#import "UIColor+Common.h"

#import "YXGoodsSpecHotCommentViewModel.h"

@interface YXGoodsSpecHotCommentTabCell ()

/** <#注释#> */
@property (nonatomic, strong) UIImageView *iconImageView;
/** <#注释#> */
@property (nonatomic, strong) UILabel *nameLabel;
/** <#注释#> */
@property (nonatomic, strong) UIImageView *levelImageView;
/** <#注释#> */
@property (nonatomic, strong) UILabel *dateLabel;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecCommentStarLevelView *starView;
/** <#注释#> */
@property (nonatomic, strong) UILabel *commentLabel;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecCommentImagesView *imagesView;
/** <#注释#> */
@property (nonatomic, strong) UILabel *sizeLabel;
/** <#注释#> */
@property (nonatomic, strong) UIView *replayBackView;
/** <#注释#> */
@property (nonatomic, strong) UILabel *replayLabel;

@end

@implementation YXGoodsSpecHotCommentTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"YXGoodsSpecHotCommentTabCell";
    //缓存中取
    YXGoodsSpecHotCommentTabCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //创建
    if (!cell)
    {
        cell = [[YXGoodsSpecHotCommentTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _iconImageView = [[UIImageView alloc] init];
        
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.font = [UIFont systemFontOfSize:14];
        
        _levelImageView = [[UIImageView alloc] init];
        _levelImageView.backgroundColor = [UIColor greenColor];
        
        _dateLabel = [[UILabel alloc] init];
        _dateLabel.textAlignment = NSTextAlignmentRight;
        _dateLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
        _dateLabel.font = [UIFont systemFontOfSize:12];
        
        _starView = [[YXGoodsSpecCommentStarLevelView alloc] init];
        
        _commentLabel = [[UILabel alloc] init];
        _commentLabel.numberOfLines = 0;
        _commentLabel.font = [UIFont systemFontOfSize:13];
        
        _imagesView = [[YXGoodsSpecCommentImagesView alloc] init];
        
        _sizeLabel = [[UILabel alloc] init];
        _sizeLabel.font = _dateLabel.font;
        _sizeLabel.textColor = _dateLabel.textColor;
        
        _replayBackView = [[UIView alloc] init];
        _replayBackView.backgroundColor = [UIColor colorWithR:235 G:235 B:235];
        
        _replayLabel = [[UILabel alloc] init];
        _replayLabel.numberOfLines = 2;
        _replayLabel.font = _commentLabel.font;

        [self.contentView addSubview:_iconImageView];
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_levelImageView];
        [self.contentView addSubview:_dateLabel];
        [self.contentView addSubview:_starView];
        [self.contentView addSubview:_commentLabel];
        [self.contentView addSubview:_imagesView];
        [self.contentView addSubview:_sizeLabel];
        [self.contentView addSubview:_replayBackView];
        [self.contentView addSubview:_replayLabel];
        
    }
    return self;
}

-(void)setModel:(YXGoodsSpecBaseModel *)model{
    
    YXGoodsSpecHotCommentModel *obj = (YXGoodsSpecHotCommentModel *)model;
    
    _iconImageView.frame = obj.goodsSpecHotCommentDataModel.iconFrame;
    _nameLabel.frame = obj.goodsSpecHotCommentDataModel.nameFrame;
    _levelImageView.frame = obj.goodsSpecHotCommentDataModel.levelFrame;
    _dateLabel.frame = obj.goodsSpecHotCommentDataModel.dateFrame;
    _starView.frame = obj.goodsSpecHotCommentDataModel.starFrame;
    _commentLabel.frame = obj.goodsSpecHotCommentDataModel.commentFrame;
    _imagesView.frame = obj.goodsSpecHotCommentDataModel.commentImagesFrame;
    _sizeLabel.frame = obj.goodsSpecHotCommentDataModel.sizeFrame;
    _replayBackView.frame = obj.goodsSpecHotCommentDataModel.replyFrame;
    
    CGFloat x = _replayBackView.frame.origin.x + 5;
    CGFloat y = _replayBackView.frame.origin.y + 5;
    CGFloat width = _replayBackView.frame.size.width - 10;
    CGFloat height = _replayBackView.frame.size.height - 10;
    _replayLabel.frame = CGRectMake(x, y, width, height);
    
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:obj.goodsSpecHotCommentDataModel.frontUserAvatar] placeholderImage:[UIImage imageNamed:@"mine_default_head"]];
    _nameLabel.text = obj.goodsSpecHotCommentDataModel.frontUserName;
    _dateLabel.text = obj.goodsSpecHotCommentDataModel.createTimeString;
    _starView.starVO = obj.goodsSpecHotCommentDataModel.starVO;
    [_commentLabel setLabelText:obj.goodsSpecHotCommentDataModel.content lineSpacing:3];
    if ([obj.goodsSpecHotCommentDataModel.picList count]) {
        _imagesView.picList = obj.goodsSpecHotCommentDataModel.picList;
        _imagesView.hidden = NO;
    } else {
        _imagesView.hidden = YES;
    }
    _levelImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"vip_member_v%zd",obj.goodsSpecHotCommentDataModel.memberLevel]];
    
    _sizeLabel.text = obj.goodsSpecHotCommentDataModel.skuString;
    if (obj.goodsSpecHotCommentDataModel.commentReplyVO) {
        [self configReplayLabelWithModel:obj];
        _replayLabel.hidden = NO;
        _replayBackView.hidden = NO;
    } else {
        _replayLabel.hidden = YES;
        _replayBackView.hidden = YES;
    }
    
    [_iconImageView cornerRadiusRoundingRect];
    
    [super setModel:model];
}

-(void)configReplayLabelWithModel:(YXGoodsSpecHotCommentModel *)model{
    
    [_replayLabel setLabelText:model.goodsSpecHotCommentDataModel.commentReplyVO.replyContent lineSpacing:3];
    
    NSString *string = [NSString stringWithFormat:@"%@%@",model.goodsSpecHotCommentDataModel.commentReplyVO.replyerName,model.goodsSpecHotCommentDataModel.commentReplyVO.replyContent];
    
    CGFloat preLength = [model.goodsSpecHotCommentDataModel.commentReplyVO.replyerName length];
    
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:string];
    NSDictionary * firstAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#222222"],};
    NSDictionary * secondAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13],NSForegroundColorAttributeName:[UIColor colorWithHexString:@"#969696"],};
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:3];
    [paragraphStyle setLineBreakMode:_replayLabel.lineBreakMode];
    [paragraphStyle setAlignment:_replayLabel.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [string length])];
    
    [attributedString addAttributes:firstAttributes range:NSMakeRange(0, preLength)];
    [attributedString addAttributes:secondAttributes range:NSMakeRange(preLength, string.length -preLength)];
    _replayLabel.attributedText = attributedString;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
