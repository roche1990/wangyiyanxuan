//
//  YXGoodsSpecServicePolicyView.m
//  yanxuan
//
//  Created by Hanson on 2018/3/2.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecServicePolicyView.h"
#import "YXGoodsSpecServiceDotCell.h"
#import "YXGoodsSpecServicePolicyLayout.h"

#import <Masonry.h>

@interface YXGoodsSpecServicePolicyView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,YXGoodsSpecServicePolicyFlowLayoutDelegate>

/** <#注释#> */
@property (nonatomic, strong) UICollectionView *collectionView;

@end

static NSString * const cellIdentifier = @"YXGoodsSpecServiceDotCellCellIdentifier";

@implementation YXGoodsSpecServicePolicyView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        YXGoodsSpecServicePolicyLayout *layout = [[YXGoodsSpecServicePolicyLayout alloc] init];
        layout.delegate = self;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.userInteractionEnabled = NO;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[YXGoodsSpecServiceDotCell class] forCellWithReuseIdentifier:cellIdentifier];
        
        [self addSubview:_collectionView];
    }
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [_dataSource count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YXGoodsSpecServiceDotCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.model = [_dataSource objectAtIndex:indexPath.item];
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake([_dataSource objectAtIndex:indexPath.item].width, 17);
}

-(CGFloat)waterFlowLayout:(YXGoodsSpecServicePolicyLayout *)layout widthAtIndexPath:(NSIndexPath *)indexPath{
    
    return [_dataSource objectAtIndex:indexPath.item].width;
}

-(void)setDataSource:(NSMutableArray<YXGoodsSpecServicePolicyListModel *> *)dataSource{
    
    _dataSource = dataSource;
    
    [_collectionView reloadData];
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _collectionView.frame = self.bounds;
}

@end
