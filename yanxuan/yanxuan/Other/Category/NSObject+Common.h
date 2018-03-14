//
//  NSObject+Common.h
//  yanxuan
//
//  Created by Luuuo on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSObject (Common)

+ (CGFloat)getHeightByWidth:(CGFloat)width string:(NSString *)string font:(UIFont*)font lineSpacing:(NSUInteger )lineSpacing;
+ (CGFloat)getWidthWithString:(NSString *)string font:(UIFont *)font;

@end
