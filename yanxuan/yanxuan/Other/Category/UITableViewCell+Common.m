//
//  UITableViewCell+Common.m
//  yanxuan
//
//  Created by Hanson on 2018/3/2.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "UITableViewCell+Common.h"
#import <objc/runtime.h>

static char showArrowKey;
static char rightDetailTextLabelKey;
static char lineViewKey;


@implementation UITableViewCell (Common)

-(void)addArrowImageView {
    
    self.arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"commoditydetail_ic_list_arrow"]];
    [self.contentView addSubview:self.arrowImageView];
    
    [self.arrowImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constrant1 = [NSLayoutConstraint constraintWithItem:self.arrowImageView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:7.0];
    NSLayoutConstraint *constrant2 = [NSLayoutConstraint constraintWithItem:self.arrowImageView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:13];
    NSLayoutConstraint *constrant3 = [NSLayoutConstraint constraintWithItem:self.arrowImageView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-15.0];
    NSLayoutConstraint *constrant4 = [NSLayoutConstraint constraintWithItem:self.arrowImageView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    [self.contentView removeConstraints:@[constrant1,constrant2,constrant3,constrant4]];
    [self.contentView addConstraints:@[constrant1,constrant2,constrant3,constrant4]];
}

-(void)addRightDetailTextLabel{
    
    self.rightDetailTextLabel = [[UILabel alloc] init];
    self.rightDetailTextLabel.font = [UIFont systemFontOfSize:14];
    self.rightDetailTextLabel.textColor = [UIColor colorWithRed:150/255.0 green:150/255.0 blue:150/255.0 alpha:1];
    self.rightDetailTextLabel.textAlignment = NSTextAlignmentRight;
    
    [self.contentView addSubview:self.rightDetailTextLabel];
    
    [self.rightDetailTextLabel setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constrant1 = [NSLayoutConstraint constraintWithItem:self.rightDetailTextLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:(self.arrowImageView?- 15.0 - 7 - 5:- 15.0)];
    NSLayoutConstraint *constrant2 = [NSLayoutConstraint constraintWithItem:self.rightDetailTextLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0];
    
    [self.contentView removeConstraints:@[constrant1,constrant2]];
    [self.contentView addConstraints:@[constrant1,constrant2]];
}

-(void)showCommonTitle{
    
    self.textLabel.font = [UIFont systemFontOfSize:14];
    self.textLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1];
}

-(void)showBottomLineWithType:(YXCellLineType)type{
    
    [self showBottomLineWithType:type lineWidth:0.5];
}

-(void)showBottomLineWithType:(YXCellLineType)type lineWidth:(CGFloat )width{
    
    self.lineView = [[UIView alloc] init];
    self.lineView.backgroundColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    [self.contentView addSubview:self.lineView];

    [self.lineView setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constrant1 = [NSLayoutConstraint constraintWithItem:self.lineView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:0.5];
    NSLayoutConstraint *constrant2 = [NSLayoutConstraint constraintWithItem:self.lineView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:0.0];
    NSLayoutConstraint *constrant3 = [NSLayoutConstraint constraintWithItem:self.lineView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0.0];
    NSLayoutConstraint *constrant4 = [NSLayoutConstraint constraintWithItem:self.lineView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];

    switch (type) {
        case kYXCellLineTypeLong:
        {
            constrant4 = [NSLayoutConstraint constraintWithItem:self.lineView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0.0];
        }
            break;
        case kYXCellLineTypeShort:
        {
            constrant4 = [NSLayoutConstraint constraintWithItem:self.lineView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:15.0];
        }
            break;
    }

    [self.contentView removeConstraints:@[constrant1,constrant2,constrant3,constrant4]];
    [self.contentView addConstraints:@[constrant1,constrant2,constrant3,constrant4]];
}

-(void)setLineView:(UIView *)lineView{
    
    objc_setAssociatedObject(self, &lineViewKey, lineView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)lineView{
    
    return objc_getAssociatedObject(self, &lineViewKey);
}


-(void)setRightDetailTextLabel:(UIImageView *)rightDetailTextLabel{
    
    objc_setAssociatedObject(self, &rightDetailTextLabelKey, rightDetailTextLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)rightDetailTextLabel{
    
    return objc_getAssociatedObject(self, &rightDetailTextLabelKey);
}

-(void)setArrowImageView:(UIImageView *)arrowImageView{
    
    objc_setAssociatedObject(self, &showArrowKey, arrowImageView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSNumber *)arrowImageView{
    
    return objc_getAssociatedObject(self, &showArrowKey);
}

@end
