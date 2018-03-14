//
//  YXGoodsSpecHeaderFooterView.m
//  yanxuan
//
//  Created by Hanson on 2018/3/6.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecHeaderFooterView.h"
#import "UIColor+Common.h"

@implementation YXGoodsSpecHeaderFooterView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#F8F8F8"];
    }
    
    return self;
}

@end
