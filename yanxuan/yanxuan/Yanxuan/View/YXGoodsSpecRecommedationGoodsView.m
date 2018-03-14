//
//  YXGoodsSpecRecommedationGoodsView.m
//  yanxuan
//
//  Created by Luuuo on 2018/3/4.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecRecommedationGoodsView.h"
#import "YXGoodsSpecRecommendationGoodsCell.h"

#import "DefineFile.h"

#import "UIColor+Common.h"

@interface YXGoodsSpecRecommedationGoodsView ()<UICollectionViewDelegate,UICollectionViewDataSource>

/** <#注释#> */
@property (nonatomic, strong) UICollectionView *collectionView;

@end

static NSString * const cellIdentifier = @"YXGoodsSpecRecommendationGoodsCellIdentifier";

@implementation YXGoodsSpecRecommedationGoodsView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(118, 199);
        layout.minimumLineSpacing = 15;
        layout.minimumInteritemSpacing = 0;
        layout.sectionInset = UIEdgeInsetsMake(15, 15, 0, 15);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kYXGoodsSpecRecommendationCellHeight) collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[YXGoodsSpecRecommendationGoodsCell class] forCellWithReuseIdentifier:cellIdentifier];
        
        [self addSubview:_collectionView];
    }
    
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    _collectionView.frame = self.bounds;
}

#pragma mark - Delegate

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [_recommedationList count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YXGoodsSpecRecommendationGoodsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.model = [_recommedationList objectAtIndex:indexPath.item];
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YXGoodsSpecRecommedationDataModel *model = [_recommedationList objectAtIndex:indexPath.item];
    
    NSLog(@"model.name = %@",model.name);
    !self.didClickGoodsWithRecommedationGoodsViewViewBlock?:self.didClickGoodsWithRecommedationGoodsViewViewBlock(model.id);
}

#pragma mark - event response
#pragma mark - private methods
#pragma mark - lazy loading

-(void)setRecommedationList:(NSMutableArray *)recommedationList{
    
    _recommedationList = recommedationList;
    
    [_collectionView reloadData];
}

@end
