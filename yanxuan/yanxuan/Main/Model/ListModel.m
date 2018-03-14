//
//  ListModel.m
//  yanxuan
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "ListModel.h"

@implementation ListModel

+(instancetype)initWithViewControllerType:(ViewControllerType)viewControllerType{
    
    ListModel *model = [self.class new];
    
    switch (viewControllerType) {
        case kViewControllerTypeYX:
        {
            model.viewControllerName = @"YXGoodsViewController";
            model.name = @"严选商品详情";
            
        }
            break;
    }
    
    model.viewControllerType = viewControllerType;
    return model;
}

@end
