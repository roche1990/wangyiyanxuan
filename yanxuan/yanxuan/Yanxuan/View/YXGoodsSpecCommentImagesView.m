//
//  YXGoodsSpecCommentImagesView.m
//  yanxuan
//
//  Created by Luuuo on 2018/3/3.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecCommentImagesView.h"
#import "DefineFile.h"

#import "YXGoodsSpecHotCommentImageCell.h"

@interface YXGoodsSpecCommentImagesView ()<UICollectionViewDelegate,UICollectionViewDataSource>

/** <#注释#> */
@property (nonatomic, strong) UICollectionView *collectionView;

@end

static NSString * const cellIdentifier = @"YXGoodsSpecHotCommentImageCellIdentifier";

@implementation YXGoodsSpecCommentImagesView

#pragma mark - life cycle

-(instancetype)init{
    
    if (self = [super init]) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(kYXGoodsSpecHotCommentImagesHeight, kYXGoodsSpecHotCommentImagesHeight);
        layout.minimumLineSpacing = 15;
        layout.minimumInteritemSpacing = 0;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[YXGoodsSpecHotCommentImageCell class] forCellWithReuseIdentifier:cellIdentifier];
        
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
    
    return [_picList count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    YXGoodsSpecHotCommentImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.imageString = [_picList objectAtIndex:indexPath.item];
    return cell;
}

#pragma mark - event response
#pragma mark - private methods
#pragma mark - lazy loading

-(void)setPicList:(NSArray *)picList{
    
    _picList = picList;
    
    [_collectionView reloadData];
}


@end
