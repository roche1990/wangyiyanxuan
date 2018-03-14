//
//  HttpRequest.h
//  yanxuan
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^NetworkResponseSuccess)(id response);
typedef void (^NetworkResponseFail)(NSError *error);
typedef void (^NetworkProgress)(NSProgress *loadProgress);

@interface HttpRequest : NSObject

+ (instancetype)sharedInstance;

- (void)configBaseURL:(NSString *)baseURL;

- (void)configHttpHeader:(NSDictionary *)httpHeader;

//GET方法
- (NSURLSessionTask *)GET:(NSString *)URLString
               parameters:(id)parameters
                  success:(NetworkResponseSuccess)success
                  failure:(NetworkResponseFail)failure;

//POST方法
- (NSURLSessionTask *)POST:(NSString *)URLString
                parameters:(id)parameters
                   success:(NetworkResponseSuccess)success
                   failure:(NetworkResponseFail)failure;

@end
