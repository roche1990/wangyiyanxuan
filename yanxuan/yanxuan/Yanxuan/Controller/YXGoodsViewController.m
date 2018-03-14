//
//  YXGoodsViewController.m
//  yanxuan
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsViewController.h"

#import "YXGoodsDetailViewController.h"
#import "YXGoodsEvaluationViewController.h"
#import "YXGoodsSpecViewController.h"

#import "YXSegmentedControl.h"
#import "YXGoodsDetailOperationBar.h"
#import "YXGoodsNavigationButton.h"
#import "YXGoodsBackToTopButton.h"

#import "YXGoodsNavigationViewModel.h"

@interface YXGoodsViewController ()<UIGestureRecognizerDelegate,UIScrollViewDelegate>
/** <#注释#> */
@property (nonatomic, strong) UIScrollView *scrollView;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsDetailOperationBar *goodsDetailOperationBar;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsBackToTopButton *goodsBackToTopButton;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsNavigationViewModel *goodsNavigationViewModel;
/** <#注释#> */
@property (nonatomic, weak) YXGoodsSpecViewController *goodsSpecViewController;
/** <#注释#> */
@property (nonatomic, weak) YXGoodsDetailViewController *goodsDetailViewController;
/** <#注释#> */
@property (nonatomic, weak) YXGoodsEvaluationViewController *goodsEvaluationViewController;
/** <#注释#> */
@property (nonatomic, weak) UIView *evaluationView;
/** <#注释#> */
@property (nonatomic, assign) CFRunLoopObserverRef runloopObserverBeforeWaiting;


@end

@implementation YXGoodsViewController

#define contentHeight kScreenHeight - kNavgationHeight - kStatusBarHeight - kYXGoodsDetailOperationBarHeight - kAdjustHeight

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingBaseUrl];
    [self settingBaseInformation];
    [self settingNavigationBar];
    [self settingScrollView];
    [self addAdjustView];
    [self settingSubViewController];
    [self settingGoodsBackToTopButton];
    [self settingGoodsDetailOperationBar];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    
    [kNotificationCenter removeObserver:self];
}

#pragma mark - private methods

-(void)loadData{
    
    
}

-(void)loadGoodsWebView{
    
    if (!_goodsDetailViewController.webViewLoaded) {
        [_goodsDetailViewController starLoadWebView];
        NSLog(@"load detail");
    }

    if (!_goodsEvaluationViewController.webViewLoaded) {
        [_goodsEvaluationViewController starLoadWebView];
        NSLog(@"load Evaluation");
    }
    
    CFRunLoopRemoveObserver(CFRunLoopGetCurrent(), _runloopObserverBeforeWaiting, kCFRunLoopDefaultMode);
    CFRelease(_runloopObserverBeforeWaiting);
}

-(void)goodsWebViewLoadFinish{
    
    if (_goodsEvaluationViewController.webViewLoaded&&_goodsDetailViewController.webViewLoaded) {
        
        NSLog(@"webView LoadFinish");
    }
}

-(void)createDetailViewContrllerWithType:(YXGoodsDetailViewControllerType )type{
    
    YXGoodsEvaluationViewController *detailViewContrller = [[YXGoodsEvaluationViewController alloc] init];
    detailViewContrller.view.frame = CGRectMake(0, contentHeight, kScreenWidth, contentHeight);
    detailViewContrller.webView.frame = CGRectMake(0, 0, kScreenWidth, contentHeight);
    [_scrollView addSubview:detailViewContrller.view];
    [self addChildViewController:detailViewContrller];
    LSWeakSelf(self);
    [detailViewContrller setWebViewLoadFinishBlock:^{
        [weakself goodsWebViewLoadFinish];
    }];
    
    switch (type) {
        case kYXGoodsDetailViewControllerTypeDetail:
        {
            detailViewContrller.urlString = [BASE_URL stringByAppendingFormat:@"/webview/itemDetail.html?id=%zd",_goods_id];
            _goodsDetailViewController = detailViewContrller;
        }
            break;
        case kYXGoodsDetailViewControllerTypeEvaluation:
        {
            detailViewContrller.urlString = [BASE_URL stringByAppendingFormat:@"/item/expert/report?id=%zd",_goods_id];
            _goodsEvaluationViewController = detailViewContrller;
            _evaluationView = detailViewContrller.view;
            _evaluationView.hidden = YES;
        }
            break;
    }
    
}

-(void)scrollViewTopPageWithIdx:(NSUInteger )idx{
    
    switch (idx) {
        case 0:
        {
            [self scrollViewToSpecPage];
        }
            break;
        case 1:
        case 2:
        {
            [UIView animateWithDuration:0.25 animations:^{
                _scrollView.contentOffset = CGPointMake(0, contentHeight);
            }];
            [UIView animateWithDuration:0.5 animations:^{
                _goodsBackToTopButton.alpha = 1;
            }];
            _evaluationView.hidden = (idx == 1);
            _goodsNavigationViewModel.evaluation = (idx == 2);
            
        }
            break;
            
        default:
            break;
    }
}

-(void)scrollViewToSpecPage{
    
    [UIView animateWithDuration:0.5 animations:^{
        _scrollView.contentOffset = CGPointMake(0, 0);
    }];
    [UIView animateWithDuration:0.5 animations:^{
        _goodsBackToTopButton.alpha = 0;
    }];
    
    [_goodsNavigationViewModel settingSegmentedControlselectIdx:0];
}

-(void)scrollToSpecPageByNotification{
    
    [self scrollViewToSpecPage];
}

-(void)scrollToDetailPageByNotification{
    
    [UIView animateWithDuration:0.5 animations:^{
        _scrollView.contentOffset = CGPointMake(0, contentHeight);
    }];
    [UIView animateWithDuration:0.5 animations:^{
        _goodsBackToTopButton.alpha = 1.0;
    }];
    [_goodsNavigationViewModel settingSegmentedControlselectIdx:1];
}


#pragma mark setting methods

-(void)settingBaseUrl{
    
    [kUserDefaults setObject:@"https://m.you.163.com" forKey:kBASE_URL];
    [kUserDefaults synchronize];
}

-(void)settingBaseInformation{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [kNotificationCenter addObserver:self selector:@selector(scrollToSpecPageByNotification) name:nYXGoodsScrollToSpecPageNotification object:nil];
    [kNotificationCenter addObserver:self selector:@selector(scrollToDetailPageByNotification) name:nYXGoodsScrollToDetailPageNotification object:nil];
    
}

-(void)settingNavigationBar{
    
    _goodsNavigationViewModel = [[YXGoodsNavigationViewModel alloc] init];
    
    LSWeakSelf(self);
    [_goodsNavigationViewModel setDidClickSegmentedControlBlock:^(NSUInteger idx) {
        
        [weakself scrollViewTopPageWithIdx:idx];
    }];
    
    [_goodsNavigationViewModel configNavigationWithViewController:self];
}

-(void)settingGoodsBackToTopButton{
    _goodsBackToTopButton = [YXGoodsBackToTopButton initWithWithTarget:self withAction:@selector(didClickBackToTopButton)];
    _goodsBackToTopButton.alpha = 0;
    [self.view addSubview:_goodsBackToTopButton];
}

-(void)settingGoodsDetailOperationBar{
    
    _goodsDetailOperationBar = [[YXGoodsDetailOperationBar alloc] initWithFrame:CGRectMake(0, kScreenHeight - kYXGoodsDetailOperationBarHeight - kAdjustHeight, kScreenWidth, kYXGoodsDetailOperationBarHeight)];
    [self.view addSubview:_goodsDetailOperationBar];
}

-(void)settingScrollView{
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kNavgationHeight + kStatusBarHeight, kScreenWidth, contentHeight)];
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.clipsToBounds = NO;
    [self.view addSubview:_scrollView];
}

-(void)settingObserverRunloop{
    
    _runloopObserverBeforeWaiting = CFRunLoopObserverCreateWithHandler(
                                                                        kCFAllocatorDefault, kCFRunLoopBeforeWaiting, YES, 0,
                                                                              ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
                                                                                  [self performSelector:@selector(loadGoodsWebView)
                                                                                               onThread:[NSThread mainThread]
                                                                                             withObject:nil
                                                                                          waitUntilDone:NO
                                                                                                  modes:@[NSDefaultRunLoopMode]];
                                                                              });
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), _runloopObserverBeforeWaiting, kCFRunLoopDefaultMode);
    
}

-(void)settingSubViewController{
    
    YXGoodsSpecViewController *goodsSpecViewController = [[YXGoodsSpecViewController alloc] init];
    _goodsSpecViewController = goodsSpecViewController;
    _goodsSpecViewController.goods_id = _goods_id;
    [goodsSpecViewController.view setHeight:contentHeight];
    [goodsSpecViewController.tableView setHeight:contentHeight];
    [_scrollView addSubview:goodsSpecViewController.view];
    [self addChildViewController:goodsSpecViewController];
    LSWeakSelf(self);
    [goodsSpecViewController setDidClickGoodsWithSpecViewControllerBlock:^(NSInteger goods_id) {
        YXGoodsViewController *goodsViewController = [[YXGoodsViewController alloc] init];
        goodsViewController.goods_id = goods_id;
        [weakself.navigationController pushViewController:goodsViewController animated:YES];
    }];
    
    [goodsSpecViewController setLoadDataFinishBlock:^{
        [weakself settingObserverRunloop];
    }];
    
    [self createDetailViewContrllerWithType:kYXGoodsDetailViewControllerTypeDetail];
    [self createDetailViewContrllerWithType:kYXGoodsDetailViewControllerTypeEvaluation];
    
}


#pragma mark - Delegate


#pragma mark - event response

-(void)didClickBackButton{
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)didClickShareButton{
    
    NSLog(@"分享");
}

-(void)didClickHomeButton{
    
    [self.navigationController popViewControllerAnimated:NO];
}

-(void)didClickBackToTopButton{
    
    [self scrollViewToSpecPage];
    
    [UIView animateWithDuration:0.25 animations:^{
        _goodsSpecViewController.tableView.contentOffset = CGPointMake(0, 0);
    }];
    
}

#pragma mark - lazy loading

@end

