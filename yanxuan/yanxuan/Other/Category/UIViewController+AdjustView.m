//
//  UIViewController+AdjustView.m
//  yanxuan
//
//  Created by Hanson on 2018/3/5.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "UIViewController+AdjustView.h"
#import <objc/runtime.h>

static char adjustViewKey;

@implementation UIViewController (AdjustView)

-(void)addAdjustView {
    
    if (!(([[UIScreen mainScreen] bounds].size.height - 812) ? NO : YES)) {
        
        return;
    }
    
    self.adjustView = [[UIView alloc] init];
    self.adjustView.backgroundColor = [UIColor colorWithRed:248/255.0 green:248/255.0 blue:248/255.0 alpha:1.0];
    [self.view addSubview:self.adjustView];
    
    [self.adjustView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constrant1 = [NSLayoutConstraint constraintWithItem:self.adjustView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:43];
    NSLayoutConstraint *constrant2 = [NSLayoutConstraint constraintWithItem:self.adjustView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
    NSLayoutConstraint *constrant3 = [NSLayoutConstraint constraintWithItem:self.adjustView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    NSLayoutConstraint *constrant4 = [NSLayoutConstraint constraintWithItem:self.adjustView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    
    [self.view removeConstraints:@[constrant1,constrant2,constrant3,constrant4]];
    [self.view addConstraints:@[constrant1,constrant2,constrant3,constrant4]];
}

-(void)setAdjustView:(UIImageView *)adjustView{
    
    objc_setAssociatedObject(self, &adjustViewKey, adjustView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)adjustView{
    
    return objc_getAssociatedObject(self, &adjustViewKey);
}

@end
