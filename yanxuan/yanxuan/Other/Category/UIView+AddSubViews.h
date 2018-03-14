//
//  UIView+AddSubViews.h
//  yanxuan
//
//  Created by Hanson on 2018/3/5.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YXDividingLineType) {
    kYXDividingLineTypeLeft = 0,
    kYXDividingLineTypeTop,
    kYXDividingLineTypeRight,
    kYXDividingLineTypeBottom
};

@interface UIView (AddSubViews)

-(void)addDividingLineWithDirectionType:(YXDividingLineType)lineType;
-(void)addDividingLineWithDirectionType:(YXDividingLineType)lineType lineColor:(UIColor *)color;
-(void)addDividingLineWithDirectionType:(YXDividingLineType)lineType lineColor:(UIColor *)color lineWidth:(CGFloat )width;

@end
