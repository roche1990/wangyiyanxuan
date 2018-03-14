//
//  YXGoodsBannerCellIdxLabel.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXGoodsBannerCellIdxLabel : UILabel

/** <#name#> */
@property (nonatomic, assign) NSUInteger idx;

-(instancetype)initWithMaxIdx:(NSUInteger )maxIdx;

@end
