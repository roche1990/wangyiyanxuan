//
//  YXGoodsSpecServicePolicyLayout.h
//  yanxuan
//
//  Created by Hanson on 2018/3/2.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YXGoodsSpecServicePolicyLayout;

@protocol  YXGoodsSpecServicePolicyFlowLayoutDelegate <NSObject>
/**通过代理获得每个cell的宽度*/
- (CGFloat)waterFlowLayout:(YXGoodsSpecServicePolicyLayout *)layout widthAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface YXGoodsSpecServicePolicyLayout : UICollectionViewFlowLayout

@property(nonatomic,assign)CGFloat rowHeight;

@property (nonatomic,assign) id<YXGoodsSpecServicePolicyFlowLayoutDelegate> delegate;

@end
