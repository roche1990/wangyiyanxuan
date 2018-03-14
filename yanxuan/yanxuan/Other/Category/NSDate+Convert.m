//
//  NSDate+Convert.m
//  yanxuan
//
//  Created by Luuuo on 2018/3/4.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "NSDate+Convert.h"

@implementation NSDate (Convert)

static NSDateFormatter *_displayFormatter = nil;

+ (void)initializeStatics {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        @autoreleasepool {
            if (_displayFormatter == nil) {
                _displayFormatter = [[NSDateFormatter alloc] init];
            }
        }
    });
}

+ (NSDateFormatter *)sharedDateFormatter {
    [self initializeStatics];
    return _displayFormatter;
}

+ (NSString *) dateYTomWithTimeStamp:(long )timeStamp{
    
    NSDate *date = [[NSDate alloc] initWithTimeIntervalSince1970:timeStamp/1000];
    
    NSDateFormatter *format= [self sharedDateFormatter];
    
    [format setDateFormat:@"YYYY.MM.dd HH:mm"];
    
    return  [format stringFromDate:date];
    
}

@end
