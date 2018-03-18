//
//  YXLoadingView.m
//  yanxuan
//
//  Created by Luuuo on 2018/3/15.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXLoadingView.h"

@interface YXLoadingView ()
/** <#注释#> */
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation YXLoadingView

-(instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [_activityIndicatorView startAnimating];
        [self addSubview:_activityIndicatorView];
        self.backgroundColor = [UIColor whiteColor];
    }
    
    return self;
}

+(instancetype)addToView:(UIView *)view{
    
   YXLoadingView *loadView = [[YXLoadingView alloc] initWithFrame:view.frame];
    loadView.activityIndicatorView.center = view.center;
    [view addSubview:loadView];
    return loadView;
}

+(void)hiddenForView:(UIView *)view{
    
    NSEnumerator *subViews = [view.subviews reverseObjectEnumerator];
    
    for (UIView *subView in subViews) {
        
        if ([subView isKindOfClass:self]) {
            
            YXLoadingView *loadingView = (YXLoadingView *)subView;
            
            [loadingView.activityIndicatorView stopAnimating];
            
            [loadingView removeFromSuperview];
        }
    }
}

+(instancetype)getLoadViewForView:(UIView *)view{
    
    YXLoadingView *loadingView;
    
    NSEnumerator *subViews = [view.subviews reverseObjectEnumerator];
    
    for (UIView *subView in subViews) {
        
        if ([subView isKindOfClass:self]) {
            
            loadingView = (YXLoadingView *)subView;
        }
    }
    
    return loadingView;
}

@end
