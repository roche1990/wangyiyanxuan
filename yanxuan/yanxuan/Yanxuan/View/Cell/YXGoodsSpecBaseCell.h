//
//  YXGoodsSpecBaseCell.h
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "BaseTableViewCell.h"
#import "YXGoodsSpecBaseModel.h"

#import "DefineFile.h"
#import "UIColor+Common.h"
#import "UITableViewCell+Common.h"

#import <SDWebImage/UIImageView+WebCache.h>

@interface YXGoodsSpecBaseCell : BaseTableViewCell
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecBaseModel *model;

+(instancetype)cellWithTableView:(UITableView *)tableView;

@end
