//
//  YXSegmentedControl.h
//  yanxuan
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXSegmentedControl : UISegmentedControl

/** <#注释#> */
@property (nonatomic, copy) void(^didClickSegmentedControlBlock) (NSUInteger idx);

@end
