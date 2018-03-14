//
//  YXGoodsViewModel.m
//  yanxuan
//
//  Created by Hanson on 2018/3/7.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsViewModel.h"
#import "DefineFile.h"
#import <Ono.h>

#import "NSDictionary+Common.h"

@interface YXGoodsViewModel ()
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecBannerModel *goodsSpecBannerModel;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecFeatureModel *goodsSpecFeatureModel;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecDescriptModel *goodsSpecDescriptModel;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecSpecModel *goodsSpecSpecModel;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecCouponModel *goodsSpecCouponModel;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecIntegralModel *goodsSpecIntegralModel;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecServicePolicyModel *goodsSpecServicePolicyModel;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecHotCommentMenuModel *goodsSpecHotCommentMenuModel;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecHotCommentModel *goodsSpecHotCommentModel;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecRecommedationModel *goodsSpecRecommedationModel;
/** <#name#> */
@property (nonatomic, assign) NSInteger loadFinishNum;
/** <#注释#> */
@property (nonatomic, copy) loadGoodsDataSuccess finishBlock;
/** <#注释#> */
@property (nonatomic, strong) NSDictionary *goodsSpecDictionary,*goodsBannerDictionary,*goodsRecommendationDictionary,*goodsPolicyListDictionary;

@end


@implementation YXGoodsViewModel


-(void)loadTryOutEventReportDataWithId:(NSInteger )goods_id finishBlock:(loadReportDataSuccess)finishBlock{
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *urlString = [BASE_URL stringByAppendingFormat:@"/item/detail?id=%zd",goods_id];
        
        NSData *data= [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSError *error;
            ONOXMLDocument *doc=[ONOXMLDocument HTMLDocumentWithData:data error:&error];
            ONOXMLElement *postsParentElement= [doc firstChildWithXPath:@"/html/body"]; //寻找该 XPath 代表的 HTML 节点,
            [postsParentElement.children enumerateObjectsUsingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if (idx == 27) {
                    
                    NSString *json = [[element stringValue] stringByReplacingOccurrencesOfString:@"var jsonData=" withString:@""];
                    
                    NSRange range = [json rangeOfString:@"policyList="];
                    
                    json = [json substringWithRange:NSMakeRange(0, range.location - 2)];
                    
                    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
                    
                    NSDictionary *dict = [NSObject getSafeDictionary:[result objectForKey:@"tryOutEventReport"]];
                    
                    if ([dict count]) {
                        finishBlock(YES);
                    } else {
                        finishBlock(NO);
                    }
                }
                }];
            });
         });
}


-(void)loadDataWithId:(NSInteger )goods_id finishBlock:(loadGoodsDataSuccess)finishBlock{
    
    _loadFinishNum = 0;
    _finishBlock = finishBlock;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *urlString = [BASE_URL stringByAppendingFormat:@"/item/detail?id=%zd",goods_id];
        
        NSData *data= [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            NSError *error;
            ONOXMLDocument *doc=[ONOXMLDocument HTMLDocumentWithData:data error:&error];
            ONOXMLElement *postsParentElement= [doc firstChildWithXPath:@"/html/body"]; //寻找该 XPath 代表的 HTML 节点,
            [postsParentElement.children enumerateObjectsUsingBlock:^(ONOXMLElement *element, NSUInteger idx, BOOL * _Nonnull stop) {
                
                if (idx == 27) {
                    
                    NSString *json = [[element stringValue] stringByReplacingOccurrencesOfString:@"var jsonData=" withString:@""];
                    
                    NSRange range = [json rangeOfString:@"policyList="];
                    
                    NSString *policyListJson = [json substringFromIndex:range.location+range.length];
                    
                    NSRange baoyouInfoRange = [policyListJson rangeOfString:@"baoyouInfo"];
                    
                    policyListJson = [policyListJson substringWithRange:NSMakeRange(0, baoyouInfoRange.location - 2)];
                    
                    json = [json substringWithRange:NSMakeRange(0, range.location - 2)];
                    
                    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
                    
                    NSArray *policyList = [NSJSONSerialization JSONObjectWithData:[policyListJson dataUsingEncoding:NSUTF8StringEncoding] options:NSJSONReadingAllowFragments error:nil];
                    
                    _goodsPolicyListDictionary = [NSDictionary dictionaryWithObject:policyList forKey:@"policyList"];
                    
                    _goodsSpecDictionary = result;
                    _loadFinishNum ++;
                    NSLog(@"1");
                    [self loadDataFinishWithNumber:_loadFinishNum];
                }
            }];
        });
        
    });
    
    
    NSMutableDictionary *header = [NSMutableDictionary dictionary];
    NSString *recommendationUrl = [BASE_URL stringByAppendingFormat:@"/xhr/item/rcmd.json"];
    NSMutableDictionary *parameter = [NSMutableDictionary dictionary];
    [parameter setValue:[NSNumber numberWithInteger:goods_id] forKey:@"id"];
    [header setValue:@"Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Mobile/14G60 yanxuan/3.5.0 device-id/1e094db65111fb97dafb58c4b4e2ffbc app-chan-id" forKey:@"User-Agent"];
    [[HttpRequest sharedInstance] configHttpHeader:header];
    [[HttpRequest sharedInstance] POST:recommendationUrl parameters:parameter success:^(id response) {
        
        _goodsRecommendationDictionary = response;
        NSLog(@"4");
        _loadFinishNum ++;
        [self loadDataFinishWithNumber:_loadFinishNum];
    } failure:^(NSError *error) {
        NSLog(@"error = %@",error);
    }];
    
}

-(void)loadDataFinishWithNumber:(NSInteger )finishedNum{
    
    if (finishedNum == 2) {
        
        NSLog(@"netload finish");
        
        NSArray *objstringList = [NSArray arrayWithObjects:
                                  @"goodsSpecBannerModel",
                                  @"goodsSpecFeatureModel",
                                  @"goodsSpecDescriptModel",
                                  @"goodsSpecSpecModel",
                                  @"goodsSpecCouponModel",
                                  @"goodsSpecIntegralModel",
                                  @"goodsSpecServicePolicyModel",
                                  @"goodsSpecHotCommentMenuModel",
                                  @"goodsSpecHotCommentModel",
                                  @"goodsSpecRecommedationModel", nil];
        NSArray *classList = [NSArray arrayWithObjects:
                              [YXGoodsSpecBannerViewModel class],
                              [YXGoodsSpecFeatureViewModel class],
                              [YXGoodsSpecDescriptViewModel class],
                              [YXGoodsSpecSpecViewModel class],
                              [YXGoodsSpecCouponViewModel class],
                              [YXGoodsSpecIntegralViewModel class],
                              [YXGoodsSpecServicePolicyViewModel class],
                              [YXGoodsSpecHotCommentMenuViewModel class],
                              [YXGoodsSpecHotCommentViewModel class],
                              [YXGoodsSpecRecommedationViewModel class], nil];
        NSArray *dictionaryList = [NSArray arrayWithObjects:
                                   _goodsSpecDictionary,
                                   _goodsSpecDictionary,
                                   _goodsSpecDictionary,
                                   _goodsSpecDictionary,
                                   _goodsSpecDictionary,
                                   _goodsSpecDictionary,
                                   _goodsPolicyListDictionary,
                                   _goodsSpecDictionary,
                                   _goodsSpecDictionary,
                                   _goodsRecommendationDictionary, nil];
        
        NSMutableArray<YXGoodsCellViewHandleModel *> *dataHandleSource = [NSMutableArray arrayWithCapacity:objstringList.count];
        
        for (int i = 0; i < [objstringList count] ; i++) {
            
            [dataHandleSource addObject:[[YXGoodsCellViewHandleModel alloc] initWithObjString:[objstringList objectAtIndex:i]
                                                                                        class:[classList objectAtIndex:i]
                                                                                   dictionary:[dictionaryList objectAtIndex:i]]];
        }
        
        NSMutableArray *dataSource = [NSMutableArray array];
        
        dispatch_group_t dispatchGroup = dispatch_group_create();
        
        [dataHandleSource enumerateObjectsUsingBlock:^(YXGoodsCellViewHandleModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            dispatch_group_async(dispatchGroup, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(){
                @autoreleasepool {
                    
                    NSLog(@"NSThread = %@",[NSThread currentThread]);
                    
                    if ([obj.className respondsToSelector:@selector(handleWithDict:)]) {
                        
                        [self setValue:[obj.className performSelector:@selector(handleWithDict:) withObject:obj.dictionary] forKey:obj.handleObj];
                    }
                    
                }
            });
        }];
        
        dispatch_group_notify(dispatchGroup, dispatch_get_main_queue(), ^(){
            
            NSMutableArray *bannerList = [NSMutableArray arrayWithCapacity:3];
            [bannerList addObject:_goodsSpecBannerModel];
            [bannerList addObject:_goodsSpecFeatureModel];
            [bannerList addObject:_goodsSpecDescriptModel];
            
            NSMutableArray *specList = [NSMutableArray arrayWithCapacity:4];
            [specList addObject:_goodsSpecSpecModel];
            [specList addObject:_goodsSpecCouponModel];
            [specList addObject:_goodsSpecIntegralModel];
            [specList addObject:_goodsSpecServicePolicyModel];
            
            NSMutableArray *hotCommentList = [NSMutableArray arrayWithCapacity:2];
            [hotCommentList addObject:_goodsSpecHotCommentMenuModel];
            [hotCommentList addObject:_goodsSpecHotCommentModel];
            
            NSMutableArray *recommnedationList = [NSMutableArray arrayWithCapacity:1];
            [recommnedationList addObject:_goodsSpecRecommedationModel];
            
            [dataSource addObject:bannerList];
            [dataSource addObject:specList];
            [dataSource addObject:hotCommentList];
            [dataSource addObject:recommnedationList];
            
            !_finishBlock?:_finishBlock([dataSource copy]);
            
        });
        
        
    }
}

@end

@implementation YXGoodsCellViewHandleModel

-(instancetype)initWithObjString:(NSString *)obj class:(Class )className dictionary:(NSDictionary *)dictionary{
    
    if (self = [super init]) {
        
        _handleObj = obj;
        _className = className;
        _dictionary = dictionary;
    }
    
    return self;
}

@end
