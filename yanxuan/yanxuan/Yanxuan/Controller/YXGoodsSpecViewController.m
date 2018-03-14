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
#import "YXGoodsSpecDragToIntroductionView.h"

@interface YXGoodsSpecViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

/** <#注释#> */
@property (nonatomic, strong) NSMutableArray *dataSource;
/** <#注释#> */
@property (nonatomic, strong) YXGoodsCellViewModel *goodsCellViewModel;
/** <#注释#> */
@property (nonatomic, weak) YXGoodsSpecDragToIntroductionView *dragToIntroductionView;
/** <#注释#> */
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation YXGoodsSpecViewController

static const float scrollDistance = 50;

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self settingBaseInformation];
    [self loadData];
    [self settingTableView];
    [self setttingTablViewFooter];
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
    
    [kNotificationCenter addObserver:self selector:@selector(GoodsSpecBackToTop) name:nYXGoodsBackToTop object:nil];
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityIndicatorView.center = CGPointMake(self.view.center.x, self.view.center.y - kNavgationHeight - kStatusBarHeight);
    [_activityIndicatorView startAnimating];
    [self.view addSubview:_activityIndicatorView];
}

-(void)settingTableView{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:_tableView];
    [self.view bringSubviewToFront:_activityIndicatorView];
    //tag 10086 轮播图
    //tag 10087 规格选取
}

-(void)setttingTablViewFooter{
    
    _tableView.tableFooterView = [[YXGoodsSpecDragToIntroductionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 75)];
    _dragToIntroductionView = (YXGoodsSpecDragToIntroductionView *)_tableView.tableFooterView;
    _dragToIntroductionView.dragToDown = YES;
    
}

-(void)GoodsSpecBackToTop{
    
    _tableView.contentOffset = CGPointMake(0, 0);
}

-(void)loadData{
    
    [self.tableView reloadData];
    [self.activityIndicatorView stopAnimating];
}

-(YXGoodsSpecBaseCell *)configCellWithTableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    
    NSArray *list = [_dataSource objectAtIndex:indexPath.section];
    YXGoodsSpecBaseModel *model = [list objectAtIndex:indexPath.row];
    YXGoodsSpecBaseCell *cell;
    LSWeakSelf(self);
    
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
            YXGoodsSpecRecommendationTabCell *recommendationTabCell = (YXGoodsSpecRecommendationTabCell *)cell;
            [recommendationTabCell setDidClickGoodsWithRecommendationTabCellBlock:^(NSInteger good_id) {
                !weakself.didClickGoodsWithSpecViewControllerBlock?:weakself.didClickGoodsWithSpecViewControllerBlock(good_id);
            }];
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

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
    if (scrollView == _tableView) {
        
        if (scrollView.contentOffset.y+_tableView.bounds.size.height-scrollView.contentSize.height>scrollDistance) {
            
            [kNotificationCenter postNotificationName:nYXGoodsScrollToDetailPageNotification object:nil];
            
        }
    }
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    [_dragToIntroductionView stopCheckArrowImageView];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    YXGoodsBannerScaleImageView *scaleImageView = [_tableView viewWithTag:10086];
    CGFloat offset = -scrollView.contentOffset.y;
    if (offset >= 0) {
        scaleImageView.frame = CGRectMake(-offset*0.5+scaleImageView.defaultX, -offset, kScreenWidth+offset, kScreenWidth+offset);
    }
    
    CGFloat distance = scrollView.contentOffset.y+_tableView.bounds.size.height-scrollView.contentSize.height;
    if (distance>scrollDistance) {
        
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

    NSArray *list = [self.dataSource objectAtIndex:section];
    return [YXGoodsCellViewModel getCellHeightForFooterWithModel:list.lastObject];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NSArray *list = [self.dataSource objectAtIndex:section];
    LSWeakSelf(tableView);
    return [YXGoodsCellViewModel getViewForHeaderWithModel:list.firstObject WithTableView:weaktableView];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    NSArray *list = [self.dataSource objectAtIndex:section];
    LSWeakSelf(tableView);
    return [YXGoodsCellViewModel getViewForFooterWithModel:list.lastObject WithTableView:weaktableView];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSArray *list = [_dataSource objectAtIndex:indexPath.section];
    YXGoodsSpecBaseModel *model = [list objectAtIndex:indexPath.row];
    
    switch (model.goodsSpecModelType) {
        case kYXGoodsSpecModelTypeSpec:
        {
            NSLog(@"点击规格");
        }
            break;
        case kYXGoodsSpecModelTypeCoupon:
        {
            NSLog(@"点击领券");
        }
            break;
        case kYXGoodsSpecModelTypeIntegral:
        {
            NSLog(@"点击积分");
        }
            break;
        case kYXGoodsSpecModelTypeServicePolicy:
        {
            NSLog(@"点击服务");
        }
            break;
        case kYXGoodsSpecModelTypeHotCommentMenu:
        {
            NSLog(@"点击用户评价");
        }
            break;
        default:
            break;
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
