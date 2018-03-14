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
@property (nonatomic, weak) UIView *evaluationView;

@end

@implementation YXGoodsViewController

#define contentHeight kScreenHeight - kNavgationHeight - kStatusBarHeight - kYXGoodsDetailOperationBarHeight

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingBaseInformation];
    [self settingNavigationBar];
    [self settingScrollView];
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

-(void)settingBaseInformation{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    [kNotificationCenter addObserver:self selector:@selector(scrollViewToPageByNotification) name:nYXGoodsScrollviewToPageNotification object:nil];
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
    
    _goodsDetailOperationBar = [[YXGoodsDetailOperationBar alloc] initWithFrame:CGRectMake(0, kScreenHeight - kYXGoodsDetailOperationBarHeight, kScreenWidth, kYXGoodsDetailOperationBarHeight)];
    [self.view addSubview:_goodsDetailOperationBar];
}

-(void)settingScrollView{
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, kNavgationHeight + kStatusBarHeight, kScreenWidth, contentHeight)];
    _scrollView.backgroundColor = [UIColor redColor];
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.clipsToBounds = NO;
    [self.view addSubview:_scrollView];
}

-(void)settingSubViewController{
    
    YXGoodsSpecViewController *goodsSpecViewController = [[YXGoodsSpecViewController alloc] init];
    [goodsSpecViewController.view setHeight:contentHeight];
    [goodsSpecViewController.tableView setHeight:contentHeight];
    [_scrollView addSubview:goodsSpecViewController.view];
    [self addChildViewController:goodsSpecViewController];
    
    YXGoodsDetailViewController *goodsDetailViewController = [[YXGoodsDetailViewController alloc] init];
    goodsDetailViewController.view.frame = CGRectMake(0, contentHeight, kScreenWidth, contentHeight);
    goodsDetailViewController.webView.frame = goodsDetailViewController.view.bounds;
    goodsDetailViewController.urlString = @"https://m.you.163.com/webview/itemDetail.html?id=1149005";;
    [_scrollView addSubview:goodsDetailViewController.view];
    [self addChildViewController:goodsDetailViewController];
    
    YXGoodsEvaluationViewController *goodsEvaluationViewController = [[YXGoodsEvaluationViewController alloc] init];
    goodsEvaluationViewController.view.frame = CGRectMake(0, contentHeight, kScreenWidth, contentHeight);
    goodsEvaluationViewController.view.hidden = YES;
    _evaluationView = goodsEvaluationViewController.view;
    goodsEvaluationViewController.webView.frame = goodsEvaluationViewController.view.bounds;
    goodsEvaluationViewController.urlString = @"https://m.you.163.com/item/expert/report?id=1149005";
    [_scrollView addSubview:goodsEvaluationViewController.view];
    [self addChildViewController:goodsEvaluationViewController];
}

-(void)scrollViewTopPageWithIdx:(NSUInteger )idx{
    
    switch (idx) {
        case 0:
        {
            [self scrollViewToPage];
        }
            break;
        case 1:
        case 2:
        {
            [UIView animateWithDuration:0.5 animations:^{
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

-(void)scrollViewToPage{
    
    [UIView animateWithDuration:0.5 animations:^{
        _scrollView.contentOffset = CGPointMake(0, 0);
    }];
    [UIView animateWithDuration:0.5 animations:^{
        _goodsBackToTopButton.alpha = 0;
    }];
    
}

-(void)scrollViewToPageByNotification{
    
//    [_goodsNavigationViewModel settingSegmentedControlselectIdx:[self scrollViewToPage]];
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
    
    [kNotificationCenter postNotificationName:nYXGoodsBackToTop object:nil];
    [self scrollViewToPage];
    _goodsNavigationViewModel.segmentedControl.selectedSegmentIndex = 0;
}

#pragma mark - lazy loading

@end

