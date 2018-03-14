//
//  YXGoodsDetailViewController.m
//  yanxuan
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsDetailViewController.h"

@implementation YXGoodsDetailViewController
#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self settingBaseInformation];
    [self settingWebView];
    [self setttingDragToIntroductionView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    
    [_webView stopLoading];
    _webView.delegate = nil;
    [kNotificationCenter removeObserver:self];
}

#pragma mark - private methods

-(void)settingBaseInformation{
    
    [kNotificationCenter addObserver:self selector:@selector(backToTopByNotification) name:nYXGoodsBackToTop object:nil];
}

-(void)settingWebView{
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate = self;
    _webView.scrollView.delegate = self;
    _webView.scrollView.showsVerticalScrollIndicator = NO;
    _webView.opaque = NO;
    _webView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_webView];
}

-(void)setttingDragToIntroductionView{
    
    _dragToIntroductionView = [[YXGoodsSpecDragToIntroductionView alloc] initWithFrame:CGRectMake(0, -75, kScreenWidth, 75)];
    _dragToIntroductionView.dragToDown = NO;
    
    [_webView.scrollView addSubview:_dragToIntroductionView];
}

-(void)backToTopByNotification{
    
    self.webView.scrollView.contentOffset = CGPointMake(0, 0);
}

-(void)starLoadWebView{
    
    [_webView loadRequest:_request];
}

#pragma mark - Delegate
#pragma mark - webViewDelegate

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
    _webViewLoaded = YES;
    !self.webViewLoadFinishBlock?:self.webViewLoadFinishBlock();
}

#pragma mark - scrollViewDelegate

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    if (scrollView.contentOffset.y<-detailScrollDistance) {
        
        [kNotificationCenter postNotificationName:nYXGoodsScrollToSpecPageNotification object:nil];
        [kNotificationCenter postNotificationName:nYXGoodsBackToTop object:nil];
    } 
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    CGFloat distance = -scrollView.contentOffset.y;
    if (distance>detailScrollDistance) {
        
        if (_dragToIntroductionView.isUp) {
            _dragToIntroductionView.up = NO;
        }
        
    } else {
        
        if (!_dragToIntroductionView.isUp) {
            _dragToIntroductionView.up = YES;
        }
    }
    
    if (distance>0) {
        
        _dragToIntroductionView.offSet = distance;
    }
}

#pragma mark - event response

#pragma mark - lazy loading

-(void)setUrlString:(NSString *)urlString{
    
    _urlString = urlString;
    
    NSURL *url;
    
    if ([urlString hasPrefix:@"http"]) {
        url = [NSURL URLWithString:urlString];
    } else {
        url = [NSURL URLWithString:[@"https://m.you.163.com" stringByAppendingString:urlString]];
    }
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:30.0];
    
    _request  = request;
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
