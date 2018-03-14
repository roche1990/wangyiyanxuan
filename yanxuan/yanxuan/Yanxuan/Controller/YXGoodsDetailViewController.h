//
//  YXGoodsDetailViewController.h
//  yanxuan
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "BaseViewController.h"
#import "YXGoodsSpecDragToIntroductionView.h"

typedef NS_ENUM(NSInteger, YXGoodsDetailViewControllerType) {
    kYXGoodsDetailViewControllerTypeDetail = 0,
    kYXGoodsDetailViewControllerTypeEvaluation
};

static const float detailScrollDistance = 70;

@interface YXGoodsDetailViewController : BaseViewController<UIScrollViewDelegate,UIWebViewDelegate>

/** <#注释#> */
@property (nonatomic, strong) NSMutableURLRequest *request;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsSpecDragToIntroductionView *dragToIntroductionView;

/** <#注释#> */
@property (nonatomic, strong) UIWebView *webView;
/** <#注释#> */
@property (nonatomic, copy) NSString *urlString;
/** <#name#> */
@property (nonatomic, assign, getter=isWebViewLoaded) BOOL webViewLoaded;

/** <#注释#> */
@property (nonatomic, copy) void(^webViewLoadFinishBlock) (void);

-(void)settingBaseInformation;
-(void)settingWebView;
-(void)backToTopByNotification;
-(void)starLoadWebView;

@end
