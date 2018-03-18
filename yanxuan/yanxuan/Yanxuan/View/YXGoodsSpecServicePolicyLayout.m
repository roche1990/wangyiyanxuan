//
//  YXGoodsSpecServicePolicyLayout.m
//  yanxuan
//
//  Created by Hanson on 2018/3/2.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecServicePolicyLayout.h"
#import "DefineFile.h"

@interface YXGoodsSpecServicePolicyLayout ()

@property(nonatomic,strong) NSMutableArray *originXArray;
@property(nonatomic,strong) NSMutableArray *originYArray;

@end

@implementation YXGoodsSpecServicePolicyLayout

-(instancetype)init{
    
    if (self = [super init]) {
        
        self.minimumLineSpacing = 5;
        self.minimumInteritemSpacing = kYXGoodsSpecServiceCollectionSpacing;
        self.rowHeight = 17;
        self.originXArray = [NSMutableArray array];
        self.originYArray = [NSMutableArray array];
    }
    
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return NO;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    for(UICollectionViewLayoutAttributes *attrs in array){
        //类型判断
        if(attrs.representedElementCategory == UICollectionElementCategoryCell){
            UICollectionViewLayoutAttributes *theAttrs = [self layoutAttributesForItemAtIndexPath:attrs.indexPath];
            attrs.frame = theAttrs.frame;
        }
    }
    return array;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat x = self.sectionInset.left;
    
    CGFloat y = self.headerReferenceSize.height + self.sectionInset.top;
    //判断获得前一个cell的x和y
    NSInteger preRow = indexPath.row - 1;
    if(preRow >= 0){
        
        if(_originYArray.count > preRow){
            x = [_originXArray[preRow] floatValue];
            y = [_originYArray[preRow] floatValue];
        }
        NSIndexPath *preIndexPath = [NSIndexPath indexPathForItem:preRow inSection:indexPath.section];
        CGFloat preWidth = [self.delegate waterFlowLayout:self widthAtIndexPath:preIndexPath];
        x += preWidth + self.minimumInteritemSpacing;
    }
    
    CGFloat currentWidth = 0.0;
    
    if ([self.delegate respondsToSelector:@selector(waterFlowLayout: widthAtIndexPath:)]) {
        currentWidth = [self.delegate waterFlowLayout:self widthAtIndexPath:indexPath];
    }
    
    if( x + currentWidth + self.minimumLineSpacing > self.collectionView.frame.size.width){
       
        x = self.sectionInset.left;
        y += _rowHeight + self.minimumLineSpacing;
    }
    
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attrs.frame = CGRectMake(x, y, currentWidth, _rowHeight);
    _originXArray[indexPath.row] = @(x);
    _originYArray[indexPath.row] = @(y);
    
    return attrs;
}

@end
