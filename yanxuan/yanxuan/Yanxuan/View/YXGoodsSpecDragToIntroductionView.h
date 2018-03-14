//
//  YXGoodsSpecDragToIntroductionView.h
//  yanxuan
//
//  Created by Hanson on 2018/3/6.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXGoodsSpecDragToIntroductionView : UIView

/** <#name#> */
@property (nonatomic, assign, getter=isUp) BOOL up;
/** <#name#> */
@property (nonatomic, assign, getter=isDragToDown) BOOL dragToDown;
/** <#name#> */
@property (nonatomic, assign) CGFloat offSet;

-(void)stopCheckArrowImageView;

@end
