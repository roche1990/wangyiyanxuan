//
//  BaseViewController.h
//  yanxuan
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DefineFile.h"
#import "HttpRequest.h"

#import "UIView+Common.h"
#import "UIColor+Common.h"
#import "NSDictionary+Common.h"
#import "UIViewController+AdjustView.h"

@interface BaseViewController : UIViewController

/** <#name#> */
@property (nonatomic, assign, getter=isFinishLoad) BOOL finishLoad;

@end
