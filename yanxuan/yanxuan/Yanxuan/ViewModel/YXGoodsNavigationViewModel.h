//
//  YXGoodsNavigationViewModel.h
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "YXSegmentedControl.h"

@interface YXGoodsNavigationViewModel : NSObject

/** <#注释#> */
@property (nonatomic, strong) YXSegmentedControl *segmentedControl;
/** <#name#> */
@property (nonatomic, assign, getter=isEvaluation) BOOL evaluation;
/** <#name#> */
@property (nonatomic, assign, getter=isHasReport) BOOL hasReport;

/** <#注释#> */
@property (nonatomic, copy) void(^didClickSegmentedControlBlock) (NSUInteger idx);

-(void)configNavigationWithViewController:(UIViewController<UIGestureRecognizerDelegate> *)superController;
-(void)settingSegmentedControlselectIdx:(NSInteger )idx;

@end
