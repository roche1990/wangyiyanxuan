//
//  ListModel.h
//  yanxuan
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ViewControllerType) {
    kViewControllerTypeYX = 0
};

@interface ListModel : NSObject
/** <#注释#> */
@property (nonatomic, copy) NSString *name;
/** <#注释#> */
@property (nonatomic, copy) NSString *viewControllerName;
/** <#name#> */
@property (nonatomic, assign) ViewControllerType viewControllerType;

+(instancetype)initWithViewControllerType:(ViewControllerType)viewControllerType;

@end
