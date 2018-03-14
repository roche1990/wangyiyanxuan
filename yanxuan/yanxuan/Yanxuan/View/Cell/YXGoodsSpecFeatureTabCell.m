//
//  YXGoodsSpecFeatureTabCell.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecFeatureTabCell.h"

#import "YXGoodsSpecFeatureCellView.h"
#import "YXGoodsSpecFeatureModel.h"

@interface YXGoodsSpecFeatureTabCell ()
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecFeatureCellView *firstFeatureView;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecFeatureCellView *secondFeatureView;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecFeatureCellView *threeFeatureView;

@end

@implementation YXGoodsSpecFeatureTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *identifier = @"YXGoodsSpecFeatureTabCell";
    //缓存中取
    YXGoodsSpecFeatureTabCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //创建
    if (!cell)
    {
        cell = [[YXGoodsSpecFeatureTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        cell.backgroundColor = [UIColor colorWithHexString:@"F8F8F8"];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        _firstFeatureView = [[YXGoodsSpecFeatureCellView alloc] init];
        _secondFeatureView = [[YXGoodsSpecFeatureCellView alloc] init];
        _threeFeatureView = [[YXGoodsSpecFeatureCellView alloc] init];
        
        [self.contentView addSubview:_firstFeatureView];
        [self.contentView addSubview:_secondFeatureView];
        [self.contentView addSubview:_threeFeatureView];
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    CGFloat width = 100;
    CGFloat height = 36;
    
    _firstFeatureView.frame = CGRectMake(15, (60 - 36)*0.5, width, height);
    _secondFeatureView.frame = CGRectMake(0, 0, width, height);
    _secondFeatureView.center = self.contentView.center;
    _threeFeatureView.frame = CGRectMake(kScreenWidth - width - 15, (60 - 36)*0.5, width, height);
}

-(void)setModel:(YXGoodsSpecBaseModel *)model{
    
    if (!_firstFeatureView.model) {
        
        YXGoodsSpecFeatureModel *obj = (YXGoodsSpecFeatureModel *)model;
        
        [obj.characteristicList enumerateObjectsUsingBlock:^(YXGoodsSpecFeatureCharacterModel *characterModel, NSUInteger idx, BOOL * _Nonnull stop) {
            switch (idx) {
                case 0:
                {
                    _firstFeatureView.model = characterModel;
                }
                    break;
                case 1:
                {
                    _secondFeatureView.model = characterModel;
                }
                    break;
                case 2:
                {
                    _threeFeatureView.model = characterModel;
                }
                    break;
                    
                default:
                    break;
            }
        }];
    }
    
    [super setModel:model];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
