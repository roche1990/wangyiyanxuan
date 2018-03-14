//
//  UIView+Common.m
//  JavaMall
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "UIView+Common.h"

@implementation UIView (Common)

- (void)setY:(CGFloat)y{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}
- (void)setX:(CGFloat)x{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
- (void)setOrigin:(CGPoint)origin{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}
- (void)setHeight:(CGFloat)height{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}
- (void)setWidth:(CGFloat)width{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}
- (void)setSize:(CGSize)size{
    CGRect frame = self.frame;
    frame.size.width = size.width;
    frame.size.height = size.height;
    self.frame = frame;
}

-(void)cornerRadiusRoundingRect{
    
    [self layoutIfNeeded];
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:self.bounds.size];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

-(void)cornerRadiusWithNumber:(CGFloat )num{
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:num];
    CAShapeLayer *pathLayer = [CAShapeLayer layer];
    pathLayer.lineWidth = 0.1;
    pathLayer.strokeColor = [UIColor clearColor].CGColor;
    pathLayer.path = path.CGPath;
    self.layer.mask = pathLayer;
}

@end
