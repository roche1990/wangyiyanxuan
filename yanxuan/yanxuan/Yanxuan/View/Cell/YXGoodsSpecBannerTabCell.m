//
//  YXGoodsSpecBannerTabCell.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecBannerTabCell.h"

#import "YXGoodsSpecBannerModel.h"
#import "YXGoodsBannerCellIdxLabel.h"

#import "UIColor+Common.h"

@interface YXGoodsSpecBannerTabCell ()<UIScrollViewDelegate>
/** <#注释#> */
@property (nonatomic, strong) UIScrollView *scrollView;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsBannerCellIdxLabel *goodsBannerCellIdxLabel;

@end

@implementation YXGoodsSpecBannerTabCell

#pragma mark - life cycle

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"YXGoodsSpecBannerTabCell";
    //缓存中取
    YXGoodsSpecBannerTabCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //创建
    if (!cell){
        cell = [[YXGoodsSpecBannerTabCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.delegate = self;
        _scrollView.clipsToBounds = NO;
        [self.contentView addSubview:_scrollView];
        
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _scrollView.frame = self.contentView.bounds;
}


#pragma mark - private methods
#pragma mark - Delegate
#pragma mark - scrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger idx = _scrollView.contentOffset.x/kScreenWidth;
    _goodsBannerCellIdxLabel.idx = idx + 1;
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    NSInteger idx = _scrollView.contentOffset.x/kScreenWidth;
    
    for (UIView *view in _scrollView.subviews) {
        
        if ([view isKindOfClass:[YXGoodsBannerScaleImageView class]]) {
            YXGoodsBannerScaleImageView *imageView = (YXGoodsBannerScaleImageView *)view;
            if (imageView.defaultTag == idx) {
                imageView.tag = 10086;
            } else {
                imageView.tag = 0;
            }
        }
    }
    
}

#pragma mark - event response
#pragma mark - lazy loading

-(void)setModel:(YXGoodsSpecBaseModel *)model{
    
    YXGoodsSpecBannerModel *obj = (YXGoodsSpecBannerModel *)model;
    
    if (!_goodsBannerCellIdxLabel) {
        [obj.images enumerateObjectsUsingBlock:^(YXGoodsSpecBannerImageModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            YXGoodsBannerScaleImageView *imageView = [[YXGoodsBannerScaleImageView alloc] initWithFrame:CGRectMake(kScreenWidth * idx, 0, kScreenWidth, kScreenWidth)];
            imageView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
            NSURL *url = [NSURL URLWithString:obj.url];
            [imageView sd_setImageWithURL:url];
            imageView.defaultTag = idx;
            if (!idx) {
                imageView.tag = 10086;
            }
            imageView.defaultX = kScreenWidth * idx;
            [_scrollView addSubview:imageView];
        }];
        
        _scrollView.contentSize = CGSizeMake(kScreenWidth * [obj.images count], 0);
        _goodsBannerCellIdxLabel = [[YXGoodsBannerCellIdxLabel alloc] initWithMaxIdx:[obj.images count]];
        
        [self.contentView addSubview:_goodsBannerCellIdxLabel];
    }
    
    [super setModel:model];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
