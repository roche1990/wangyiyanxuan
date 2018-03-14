//
//  UIView+AddSubViews.m
//  yanxuan
//
//  Created by Hanson on 2018/3/5.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "UIView+AddSubViews.h"

@implementation UIView (AddSubViews)

-(void)addDividingLineWithDirectionType:(YXDividingLineType)lineType{
    
    [self addDividingLineWithDirectionType:lineType lineColor:[UIColor colorWithRed:220/250.0 green:220/250.0 blue:220/250.0 alpha:1.0]];
}

-(void)addDividingLineWithDirectionType:(YXDividingLineType)lineType lineColor:(UIColor *)color{
    
    [self addDividingLineWithDirectionType:lineType lineColor:color lineWidth:0.5];
}

-(void)addDividingLineWithDirectionType:(YXDividingLineType)lineType lineColor:(UIColor *)color lineWidth:(CGFloat )width{
    
    [self layoutIfNeeded];
    
    CALayer *layer = [CALayer layer];
    
    switch (lineType) {
            
        case kYXDividingLineTypeLeft:
        {
            layer.frame = CGRectMake(0, 0, width, self.frame.size.height);
        }
            break;
        case kYXDividingLineTypeTop:
        {
            layer.frame = CGRectMake(0, 0, self.frame.size.width, width);
        }
            break;
        case kYXDividingLineTypeRight:
        {
            layer.frame = CGRectMake(self.frame.size.width - 1, 0, width, self.frame.size.height);
        }
            break;
        case kYXDividingLineTypeBottom:
        {
            layer.frame = CGRectMake(0, self.frame.size.height - 1, self.frame.size.width, width);
        }
            break;
    }
    
    layer.backgroundColor = color.CGColor;
    
    [self.layer addSublayer:layer];
}

@end
