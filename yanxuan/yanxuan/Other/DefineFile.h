//
//  DefineFile.h
//  yanxuan
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#ifndef DefineFile_h
#define DefineFile_h

#define kBASE_URL @"BASE_url"
#define mBASE_URL @"https://m.mongfriends.com"
#define BASE_URL [[NSUserDefaults standardUserDefaults] objectForKey:kBASE_URL]

#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define kAppKeyWindow [UIApplication sharedApplication].keyWindow
#define kUIApplication [UIApplication sharedApplication]
#define kBundleID [[NSBundle mainBundle] bundleIdentifier]
#define kNotificationCenter [NSNotificationCenter defaultCenter]

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define kScreenBounds [UIScreen mainScreen].bounds
#define kNavgationHeight 44
#define kStatusBarHeight CGRectGetHeight([UIApplication sharedApplication].statusBarFrame)
#define kMainTabBarHeight ((deviceModel_X) ? 83 : 49)
#define kTabBarHeight ((deviceModel_X) ? 83 : 49)
#define kAdjustHeight ((deviceModel_X) ? 43 : 0)
#define kYXGoodsDetailOperationBarHeight 49

#define kYXGoodsSpecServiceCollectionWidth kScreenWidth - 15 - 33 - 10 - 10 - 7 - 15
#define kYXGoodsSpecServiceCollectionSpacing 10
#define kYXGoodsSpecHotCommentImagesHeight (kScreenWidth - 15 * 5)/4
#define kYXGoodsSpecRecommendationCellHeight 214

#define nYXGoodsScrollToSpecPageNotification @"nYXGoodsScrollToSpecPageNotification"
#define nYXGoodsScrollToDetailPageNotification @"nYXGoodsScrollToDetailPageNotification"
#define nYXGoodsBackToTop @"nYXGoodsBackToTop"

#define LSWeakSelf(type)  __weak typeof(type) weak##type = type;
#define LSStrongSelf(type) __strong __typeof(type) strong##type = type;
#define kGetWidthWithView(view) CGRectGetWidth(view.bounds)
#define kGetHeightWithView(view) CGRectGetHeight(view.bounds)
#define kGetXWithView(view) view.frame.origin.x
#define kGetYWithView(view) view.frame.origin.y
#define kFontSize(float) [UIFont systemFontOfSize:(float)]
#define kFontBoldSize(float) [UIFont boldSystemFontOfSize:(float)]
#define kViewbringSubviewToFrontLoadingView [self.view bringSubviewToFront:[ShowLoadingView sharedShowLoadingView]];
#define kReturnByNilData if (!data) return
#define kPostRefreshPersonInfomationNoti [[NSNotificationCenter defaultCenter] postNotificationName:nRefreshPersonInfomation object:nil];
#define kloadViewWithXib [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject]
#define kloadViewWithXibByName(className) [[[NSBundle mainBundle] loadNibNamed:className owner:nil options:nil] lastObject]
#define kIsLogined ([[kUserDefaults objectForKey:@"username"] isKindOfClass:[NSString class]] && [[kUserDefaults objectForKey:@"username"] length] > 0)

#define KAddTapRecognizer(p_tapMethodName,p_View_Container)\
{\
p_View_Container.userInteractionEnabled = YES;\
SEL selector1 = NSSelectorFromString(p_tapMethodName);\
UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:selector1];\
tapRecognizer.cancelsTouchesInView = NO;\
[p_View_Container addGestureRecognizer:tapRecognizer];\
}\

#define KAddTarget(p_tapMethodName,p_View_Container)\
{\
SEL selector1 = NSSelectorFromString(p_tapMethodName);\
[p_View_Container addTarget:self action:selector1 forControlEvents:UIControlEventTouchUpInside];\
}\

#define kPopViewController(p_View_controller)\
{\
Class VCclass = NSClassFromString(p_View_controller);\
for (BaseViewController * tempVC in self.navigationController.childViewControllers) {\
\
if ([tempVC isKindOfClass:[VCclass class]]) {\
\
[self.navigationController popToViewController:tempVC animated:YES];\
};\
};\
}\

//设备型号
#define deviceModel_4s [[self deviceModelName] isEqualToString:@"iPhone 4"]||[[self deviceModelName] isEqualToString:@"iPhone 4S"]
#define deviceModel_5s [[UIScreen mainScreen] bounds].size.width == 320.0f && [[UIScreen mainScreen] bounds].size.height == 568.0f
#define deviceModel_6s [[UIScreen mainScreen] bounds].size.width == 375.0f && [[UIScreen mainScreen] bounds].size.height == 667.0f
#define deviceModel_6s_Plus [[UIScreen mainScreen] bounds].size.width == 414.0f && [[UIScreen mainScreen] bounds].size.height == 736.0f
#define deviceModel_X (([[UIScreen mainScreen] bounds].size.height - 812) ? NO : YES)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#endif /* DefineFile_h */
