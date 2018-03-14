//
//  YXGoodsSpecRecommedationSegmentsView.m
//  yanxuan
//
//  Created by Luuuo on 2018/3/4.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecRecommedationSegmentsView.h"
#import "HTSegmentsView.h"

#import "DefineFile.h"
#import "UIColor+Common.h"

@interface YXGoodsSpecRecommedationSegmentsView ()<HTSegmentsViewDelegate>

/** <#注释#> */
@property (nonatomic, strong) HTSegmentsView *segmentsView;
/** <#注释#> */
@property (nonatomic, strong) HTStringToLabelDataSource *dataSource;

@end

@implementation YXGoodsSpecRecommedationSegmentsView

#pragma mark - life cycle

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        _segmentsView = [[HTHorizontalSegmentsView alloc] initWithSelectedIndex:0];
        _segmentsView.frame = self.bounds;
        _segmentsView.segmentsDelegate = self;
        _segmentsView.backgroundColor = [UIColor whiteColor];
        
        _dataSource = [[HTStringToLabelDataSource alloc] initWithArray:@[@"大家都在看",@"24小时热销"] segmentCellClass:nil];
        _dataSource.fontSize = 14;
        _dataSource.selectedFontSize = 14;
        _dataSource.textColor = [UIColor blackColor];
        _dataSource.selectedTextColor = [UIColor colorWithR:180 G:23 B:37];
        _dataSource.cellWidth = (kScreenWidth - 60) * 0.5;
        _dataSource.cellHeight = 40;//height;
        
        _segmentsView.segmentsDataSource = _dataSource;
        
        HTSublineSegmentViewAnimator *animator = [[HTSublineSegmentViewAnimator alloc] initWithSegmentsView:_segmentsView backgroundColor:[UIColor clearColor] lineColor:[UIColor colorWithR:180 G:23 B:37] lineHeight:1.5];
        animator.lineWidthEqualToCellContent = YES;
        animator.animationDuration = 0.25;
        animator.cellContentPadding = 0;
        _segmentsView.animator = animator;
        [self addSubview:_segmentsView];
        
        [_segmentsView reloadData];
    }
    
    return self;
}


#pragma mark - Delegate

-(void)segmentsView:(HTSegmentsView *)segmentsView didSelectedAtIndex:(NSUInteger)index{
    
    !_didClickSegment?:_didClickSegment(index);
}

-(BOOL)segmentsView:(HTSegmentsView *)segmentsView shouldSelectedAtIndex:(NSUInteger)index{
    
    return YES;
}

#pragma mark - event response
#pragma mark - private methods
#pragma mark - lazy loading

@end
