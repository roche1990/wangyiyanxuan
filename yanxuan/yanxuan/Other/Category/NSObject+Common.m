//
//  NSObject+Common.m
//  yanxuan
//
//  Created by Luuuo on 2018/3/1.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "NSObject+Common.h"

@implementation NSObject (Common)

+ (CGFloat)getHeightByWidth:(CGFloat)width string:(NSString *)string font:(UIFont*)font lineSpacing:(NSUInteger )lineSpacing{
    
    if (![string isKindOfClass:[NSString class]]||string.length == 0) {
        return 0;
    }
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = lineSpacing;
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, string.length)];
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, string.length)];
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:options context:nil];
    
    return rect.size.height;
}

+ (CGFloat)getWidthWithString:(NSString *)string font:(UIFont *)font{
    
    if (![string isKindOfClass:[NSString class]]||string.length == 0) {
        return 0;
    }
    
    CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
    return size.width;
}

@end
