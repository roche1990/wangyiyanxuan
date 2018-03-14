//
//  YXGoodsSpecViewController.h
//  yanxuan
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "BaseViewController.h"

@interface YXGoodsSpecViewController : BaseViewController
/** <#注释#> */
@property (nonatomic, strong) UITableView *tableView;
/** <#name#> */
@property (nonatomic, assign) NSInteger goods_id;
/** <#注释#> */
@property (nonatomic, copy) void(^didClickGoodsWithSpecViewControllerBlock) (NSInteger);
/** <#注释#> */
@property (nonatomic, copy) void(^loadDataFinishBlock) ();

@end
