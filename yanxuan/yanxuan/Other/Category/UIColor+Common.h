//
//  UIColor+Common.h
//  yanxuan
//
//  Created by Hanson on 2018/2/28.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Common)

+(UIColor *)randomColorWithAlpha:(CGFloat )alpha;
+(UIColor *)colorWithR:(CGFloat )red G:(CGFloat )green B:(CGFloat )blue;
+(UIColor *)colorWithHexString:(NSString *)hexString;

@end
