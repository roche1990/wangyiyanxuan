//
//  YXGoodsBannerCellIdxLabel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsBannerCellIdxLabel.h"

#import "DefineFile.h"
#import "UIColor+Common.h"

static const float indexLabelheight = 15;
static const float indexLabelwidth = 27.5;

@interface YXGoodsBannerCellIdxLabel ()

/** <#name#> */
@property (nonatomic, assign) NSUInteger maxIdx;

@end

@implementation YXGoodsBannerCellIdxLabel

-(instancetype)initWithMaxIdx:(NSUInteger )maxIdx{
    
    if (self = [super init]) {
        
        _maxIdx = maxIdx;
        
        self.frame = CGRectMake(kScreenWidth-indexLabelwidth-15, kScreenWidth-indexLabelheight-15, indexLabelwidth, indexLabelheight);
        self.text = [NSString stringWithFormat:@"%zd/%zd",1,_maxIdx];
        
        self.backgroundColor = [UIColor whiteColor];
        self.textColor = [UIColor colorWithHexString:@"#222222"];
        self.font = kFontSize(10);
        self.textAlignment = NSTextAlignmentCenter;
        self.layer.borderWidth = 0.3f;
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
        self.alpha = 0.8;
        self.layer.borderColor = [UIColor colorWithHexString:@"#222222"].CGColor;
        
    }
    
    return self;
}

-(void)setIdx:(NSUInteger)idx{
    
    _idx = idx;
    
    self.text = [NSString stringWithFormat:@"%zd/%zd",idx,_maxIdx];
}

@end
