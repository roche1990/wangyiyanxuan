//
//  YXGoodsSpecViewController.m
//  yanxuan
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "YXGoodsSpecViewController.h"

#import "YXGoodsCellViewModel.h"

#import "YXGoodsSpecBannerTabCell.h"
#import "YXGoodsSpecFeatureTabCell.h"
#import "YXGoodsSpecDescriptTabCell.h"
#import "YXGoodsSpecSpecTabCell.h"
#import "YXGoodsSpecCouponTabCell.h"
#import "YXGoodsSpecIntegralTabCell.h"
#import "YXGoodsSpecServicePolicyTabCell.h"
#import "YXGoodsSpecHotCommentMenuTabCell.h"
#import "YXGoodsSpecHotCommentTabCell.h"
#import "YXGoodsSpecRecommendationTabCell.h"

@interface YXGoodsSpecViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UIWebViewDelegate>

/** <#注释#> */
@property (nonatomic, strong) NSMutableArray *dataSource;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsCellViewModel *goodsCellViewModel;

@end

@implementation YXGoodsSpecViewController

static const float scrollDistance = 100;

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self settingBaseInformation];
    [self loadData];
    [self settingTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods

-(void)settingBaseInformation{
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [kNotificationCenter addObserver:self selector:@selector(GoodsSpecBackToTop) name:nYXGoodsBackToTop object:nil];
}

-(void)settingTableView{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];
    
    //tag 10086 轮播图
    //tag 10087 规格选取
}

-(void)GoodsSpecBackToTop{
    
    _tableView.contentOffset = CGPointMake(0, 0);
}

-(void)loadData{
    
    _goodsCellViewModel = [[YXGoodsCellViewModel alloc] init];
    LSWeakSelf(self);
    [_goodsCellViewModel loadDataWithId:999 finishBlock:^(NSArray * dataList) {
        weakself.dataSource = [dataList mutableCopy];
        [weakself.tableView reloadData];
    }];
}

-(YXGoodsSpecBaseCell *)configCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    
    NSArray *list = [_dataSource objectAtIndex:indexPath.section];
    YXGoodsSpecBaseModel *model = [list objectAtIndex:indexPath.row];
    YXGoodsSpecBaseCell *cell;
    
    switch (model.goodsSpecModelType) {
        case kYXGoodsSpecModelTypeBanner:
        {
            cell = [YXGoodsSpecBannerTabCell cellWithTableView:tableView];
        }
            break;
        case kYXGoodsSpecModelTypeFeature:
        {
            cell = [YXGoodsSpecFeatureTabCell cellWithTableView:tableView];
        }
            break;
        case kYXGoodsSpecModelTypeDescript:
        {
            cell = [YXGoodsSpecDescriptTabCell cellWithTableView:tableView];
        }
            break;
        case kYXGoodsSpecModelTypeSpec:
        {
            cell = [YXGoodsSpecSpecTabCell cellWithTableView:tableView];
            
            YXGoodsSpecSpecTabCell *goodsSpecSpecTabCell = (YXGoodsSpecSpecTabCell *)cell;
            [goodsSpecSpecTabCell setDidClickSpecCellBlock:^{
                NSLog(@"选择规格");
            }];
        }
            break;
        case kYXGoodsSpecModelTypeCoupon:
        {
            cell = [YXGoodsSpecCouponTabCell cellWithTableView:tableView];
        }
            break;
        case kYXGoodsSpecModelTypeIntegral:
        {
            cell = [YXGoodsSpecIntegralTabCell cellWithTableView:tableView];
        }
            break;
        case kYXGoodsSpecModelTypeServicePolicy:
        {
            cell = [YXGoodsSpecServicePolicyTabCell cellWithTableView:tableView];
        }
            break;
        case kYXGoodsSpecModelTypeHotCommentMenu:
        {
            cell = [YXGoodsSpecHotCommentMenuTabCell cellWithTableView:tableView];
        }
            break;
        case kYXGoodsSpecModelTypeHotComment:
        {
            cell = [YXGoodsSpecHotCommentTabCell cellWithTableView:tableView];
        }
            break;
        case kYXGoodsSpecModelTypeHotRecomnetdation:
        {
            cell = [YXGoodsSpecRecommendationTabCell cellWithTableView:tableView];
        }
            break;
            
        default:
            break;
    }
    cell.model = model;
    
    return cell;
}

#pragma mark - Delegate

#pragma mark - scrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    YXGoodsBannerScaleImageView *scaleImageView = [_tableView viewWithTag:10086];
    CGFloat offset = -scrollView.contentOffset.y;
    if (offset >= 0) {
        scaleImageView.frame = CGRectMake(-offset*0.5+scaleImageView.defaultX, -offset, kScreenWidth+offset, kScreenWidth+offset);
//        NSLog(@"scaleImageView.frame = %@",NSStringFromCGRect(scaleImageView.frame));
    }
}

#pragma mark - tableViewDelegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return [_dataSource count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSArray *list = [[_dataSource objectAtIndex:section] copy];
    return [list count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [self configCellWithTableView:tableView indexPath:indexPath];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *list = [[_dataSource objectAtIndex:indexPath.section] copy];
    YXGoodsSpecBaseModel *obj = [list objectAtIndex:indexPath.row];
    return [YXGoodsCellViewModel getCellHeightForRowWithModel:obj];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    NSArray *list = [self.dataSource objectAtIndex:section];
    return [YXGoodsCellViewModel getCellHeightForHeaderWithModel:list.firstObject];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return CGFLOAT_MIN;
}
//
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    NSArray *tmpArray = [self.dataSource objectAtIndex:section];
//
//    return [CheckoutCellManager getViewForCellHeaderWithObj:tmpArray.firstObject WithTableView:tableView];
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
//
//    return nil;
//}

#pragma mark - scrollViewDelegate

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
    if (scrollView == _tableView) {
//        CGFloat y = scrollView.contentOffset.y+kScreenHeight-scrollView.contentSize.height;
//        NSLog(@"y = %lf",y);
        if (scrollView.contentOffset.y+kScreenHeight-scrollView.contentSize.height>scrollDistance+50) {
            NSLog(@"向下滚");
            [kNotificationCenter postNotificationName:nYXGoodsScrollviewToPageNotification object:nil];
            
        }
    }
    
}

#pragma mark - event response
#pragma mark - lazy loading
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
