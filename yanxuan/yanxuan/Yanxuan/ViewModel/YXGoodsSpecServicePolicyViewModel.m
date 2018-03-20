//
//  YXGoodsSpecServicePolicyViewModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecServicePolicyViewModel.h"
#import "NSObject+Common.h"
#import "DefineFile.h"

@implementation YXGoodsSpecServicePolicyViewModel

+(YXGoodsSpecServicePolicyModel *)handleWithDict:(NSDictionary *)result{
    
    NSLog(@"handleWithDict NSThread = %@",[NSThread currentThread]);
    
    YXGoodsSpecServicePolicyModel *model = [YXGoodsSpecServicePolicyModel new];
    [model.policyList removeAllObjects];
    NSArray *policyList = [NSObject getSafeArray:[result objectForKey:@"policyList"]];
    [policyList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        YXGoodsSpecServicePolicyListModel *listModel = [YXGoodsSpecServicePolicyListModel mj_objectWithKeyValues:obj];
        listModel.width = [NSObject getWidthWithString:listModel.title font:[UIFont systemFontOfSize:14]] + 10;
        [model.policyList addObject:listModel];
    }];
    
    model.height = [self getHeightWithList:[model.policyList copy]];
    
    return model;
}

+(CGFloat )getHeightWithList:(NSArray<YXGoodsSpecServicePolicyListModel*>*)list{
    __block CGFloat height = 17;
    __block CGFloat width = 0;
    __block NSInteger num = 0;
    [list enumerateObjectsUsingBlock:^(YXGoodsSpecServicePolicyListModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (num*kYXGoodsSpecServiceCollectionSpacing + width + obj.width > kYXGoodsSpecServiceCollectionWidth) {
            height += 17 + 5;
            width = 0;
            num = 0;
//            NSLog(@"换行");
        }else{
            num ++;
        }
        
        width += obj.width;
        
    }];
    
//    NSLog(@"height = %lf",height);
    
    return height;
}

@end
