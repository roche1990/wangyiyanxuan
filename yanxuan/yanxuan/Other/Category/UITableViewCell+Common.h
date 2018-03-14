//
//  UITableViewCell+Common.h
//  yanxuan
//
//  Created by Hanson on 2018/3/2.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, YXCellLineType) {
    kYXCellLineTypeLong = 0,
    kYXCellLineTypeShort
};

@interface UITableViewCell (Common)
/** <#注释#> */
@property (nonatomic, strong) UIImageView *arrowImageView;
/** <#注释#> */
@property (nonatomic, strong) UILabel *rightDetailTextLabel;
/** <#注释#> */
@property (nonatomic, strong) UIView *lineView;


-(void)addArrowImageView;
-(void)addRightDetailTextLabel;
-(void)showCommonTitle;
-(void)showBottomLineWithType:(YXCellLineType)type;
-(void)showBottomLineWithType:(YXCellLineType)type lineWidth:(CGFloat )width;

@end
