//
//  YXGoodsSpecRecommendationTabCell.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecRecommendationTabCell.h"
#import "YXGoodsSpecRecommedationSegmentsView.h"
#import "YXGoodsSpecRecommedationGoodsView.h"

#import "YXGoodsSpecRecommedationModel.h"

#import "UIView+AddSubViews.h"

@interface YXGoodsSpecRecommendationTabCell ()
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecRecommedationSegmentsView *goodsSpecRecommedationSegmentsView;
/** <#注释#> */
@property (nonatomic, strong) UIScrollView *scrollView;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecRecommedationGoodsView *leftGoodsSpecRecommedationGoodsView;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecRecommedationGoodsView *rightGoodsSpecRecommedationGoodsView;

@end

@implementation YXGoodsSpecRecommendationTabCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *identifier = @"YXGoodsSpecRecommendationTabCell";
    //缓存中取
    YXGoodsSpecRecommendationTabCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //创建
    if (!cell)
    {
        cell = [[YXGoodsSpecRecommendationTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 40, kScreenWidth, 0.5)];
        lineView.backgroundColor = [UIColor colorWithHexString:@"#DCDCDC"];
        [self.contentView addSubview:lineView];
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 40.5, kScreenWidth, kYXGoodsSpecRecommendationCellHeight)];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.clipsToBounds = NO;
        [self.contentView addSubview:_scrollView];
        
        _leftGoodsSpecRecommedationGoodsView = [[YXGoodsSpecRecommedationGoodsView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kYXGoodsSpecRecommendationCellHeight)];
        _leftGoodsSpecRecommedationGoodsView.backgroundColor = [UIColor whiteColor];
        [_scrollView addSubview:_leftGoodsSpecRecommedationGoodsView];
        
        _rightGoodsSpecRecommedationGoodsView = [[YXGoodsSpecRecommedationGoodsView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, kYXGoodsSpecRecommendationCellHeight)];
        _rightGoodsSpecRecommedationGoodsView.backgroundColor = [UIColor blueColor];
        [_scrollView addSubview:_rightGoodsSpecRecommedationGoodsView];
        
        _goodsSpecRecommedationSegmentsView = [[YXGoodsSpecRecommedationSegmentsView alloc] initWithFrame:CGRectMake(30,0,kScreenWidth-60,40)];
        
        LSWeakSelf(self);
        [_goodsSpecRecommedationSegmentsView setDidClickSegment:^(NSInteger idx) {
            
            [UIView animateWithDuration:0.25 animations:^{
                weakself.scrollView.contentOffset = CGPointMake((idx?kScreenWidth:0), 0);
            }];
        }];
        [self.contentView addSubview:_goodsSpecRecommedationSegmentsView];
    }
    return self;
}

-(void)setModel:(YXGoodsSpecBaseModel *)model{
    
    YXGoodsSpecRecommedationModel *obj = (YXGoodsSpecRecommedationModel *)model;
    
    _leftGoodsSpecRecommedationGoodsView.recommedationList = obj.recommedationList;
    LSWeakSelf(self);
    [_leftGoodsSpecRecommedationGoodsView setDidClickGoodsWithRecommedationGoodsViewViewBlock:^(NSInteger goods_id) {
        !weakself.didClickGoodsWithRecommendationTabCellBlock?:weakself.didClickGoodsWithRecommendationTabCellBlock(goods_id);
    }];
    
    _rightGoodsSpecRecommedationGoodsView.recommedationList = obj.hotGoodsList;
    [_rightGoodsSpecRecommedationGoodsView setDidClickGoodsWithRecommedationGoodsViewViewBlock:^(NSInteger goods_id) {
        !weakself.didClickGoodsWithRecommendationTabCellBlock?:weakself.didClickGoodsWithRecommendationTabCellBlock(goods_id);
    }];
    
    [super setModel:model];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
