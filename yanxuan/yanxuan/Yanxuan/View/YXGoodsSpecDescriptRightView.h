//
//  YXGoodsSpecDescriptRightView.h
//  yanxuan
//
//  Created by Luuuo on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YXGoodsSpecDescriptRightView : UIView

/** <#name#> */
@property (nonatomic, copy) NSString *commentCount;
/** <#注释#> */
@property (nonatomic, copy) void(^didClickCommentBlock)();

@end
