//
//  YXGoodsSpecRecommedationItemTagModel.h
//  yanxuan
//
//  Created by Luuuo on 2018/3/4.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YXGoodsSpecRecommedationItemTagModel : NSObject

@property (nonatomic , assign) BOOL              forbidJump;
@property (nonatomic , assign) NSInteger              itemId;
@property (nonatomic , assign) NSInteger              tagId;
@property (nonatomic , assign) NSInteger              subType;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , assign) NSInteger              type;

@end
