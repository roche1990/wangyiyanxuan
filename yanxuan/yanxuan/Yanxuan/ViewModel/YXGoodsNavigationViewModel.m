//
//  YXGoodsNavigationViewModel.m
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsNavigationViewModel.h"

#import "YXGoodsNavigationButton.h"

#import "DefineFile.h"

@implementation YXGoodsNavigationViewModel

#pragma GCC diagnostic ignored "-Wundeclared-selector"

-(void)configNavigationWithViewController:(UIViewController<UIGestureRecognizerDelegate> *)superController{
    
    superController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[YXGoodsNavigationButton initWithImageString:@"commoditydetail_detail_ic_back_2_nor" withTarget:superController withAction:@selector(didClickBackButton)]];
    
    YXGoodsNavigationButton *homeButton = [YXGoodsNavigationButton initWithImageString:@"commoditydetail_ic_details_home_black" withTarget:superController withAction:@selector(didClickHomeButton)];
    
    YXGoodsNavigationButton *shareButton = [YXGoodsNavigationButton initWithImageString:@"commoditydetail_detail_ic_share_2_nor" withTarget:superController withAction:@selector(didClickShareButton)];
    
    superController.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithCustomView:homeButton],[[UIBarButtonItem alloc] initWithCustomView:shareButton]];
    
    _segmentedControl = [[YXSegmentedControl alloc] initWithItems:@[@"商品",@"详情",@"测评"]];
    if (!_hasReport) {
        [_segmentedControl removeSegmentAtIndex:2 animated:NO];
    }
    LSWeakSelf(self);
    [_segmentedControl setDidClickSegmentedControlBlock:^(NSUInteger idx) {
        !weakself.didClickSegmentedControlBlock?:weakself.didClickSegmentedControlBlock(idx);
    }];
    [superController.navigationItem setTitleView:_segmentedControl];
    
    superController.navigationController.interactivePopGestureRecognizer.delegate = superController;
}

-(void)settingSegmentedControlselectIdx:(NSInteger )idx{
    
    switch (idx) {
        case 0:
        {
            self.segmentedControl.selectedSegmentIndex = 0;
        }
            break;
        case 1:
        {
            if (self.isEvaluation) {
                self.segmentedControl.selectedSegmentIndex = 2;
            } else {
                self.segmentedControl.selectedSegmentIndex = 1;
            }
            
        }
            break;
        default:
            break;
    }
}

@end
