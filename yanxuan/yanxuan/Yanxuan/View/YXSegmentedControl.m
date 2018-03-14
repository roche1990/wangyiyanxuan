//
//  YXSegmentedControl.m
//  yanxuan
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXSegmentedControl.h"
#import "UIColor+Common.h"

@implementation YXSegmentedControl

-(instancetype)initWithItems:(NSArray *)items{
    
    if (self = [super initWithItems:items]) {
        self.frame = CGRectMake(0, 0, 160, 30);
        self.selectedSegmentIndex = 0;
        self.tintColor = [UIColor colorWithR:127.0 G:127.0 B:127.0];
        [self addTarget:self action:@selector(didClickSegmentedControl:) forControlEvents:UIControlEventValueChanged];
    }
    
    return self;
}

-(void)didClickSegmentedControl:(UISegmentedControl *)segmentedControl{
    
    !self.didClickSegmentedControlBlock?:self.didClickSegmentedControlBlock(segmentedControl.selectedSegmentIndex);
}

@end
