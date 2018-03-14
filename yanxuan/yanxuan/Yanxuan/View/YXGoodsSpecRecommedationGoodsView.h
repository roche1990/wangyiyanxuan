//
//  YXGoodsSpecRecommedationGoodsView.h
//  yanxuan
//
//  Created by Luuuo on 2018/3/4.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXGoodsSpecRecommedationGoodsView : UIView

/** <#注释#> */
@property (nonatomic, strong) NSMutableArray *recommedationList;
/** <#注释#> */
@property (nonatomic, copy) void(^didClickGoodsWithRecommedationGoodsViewViewBlock) (NSInteger );

@end
