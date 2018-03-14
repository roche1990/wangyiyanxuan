//
//  HomeViewController.m
//  yanxuan
//
//  Created by Hanson on 2018/2/27.
//  Copyright © 2018年 Hanson. All rights reserved.
//

#import "HomeViewController.h"

#import "ListModel.h"
#import "YXGoodsViewController.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>

// UI
@property (nonatomic, strong) UITableView *tableView;

//DATA
/** <#注释#> */
@property (nonatomic, strong) NSMutableArray<ListModel *> *dataSource;

@end

static NSString * const cellIdentifier = @"homeViewControllerCellIdentifier";

@implementation HomeViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self settingBaseInformation];
    [self settingTableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods

-(void)settingBaseInformation{
    
    self.title = @"高仿严选";
    
    self.dataSource = [NSMutableArray array];
    [self.dataSource addObject:[ListModel initWithViewControllerType:kViewControllerTypeYX]];
}

-(void)settingTableView{
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    
    [self.view addSubview:_tableView];
}

#pragma mark - Delegate

#pragma mark - tableViewDelegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [_dataSource count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row].name;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.tintColor = [UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ListModel *model = [_dataSource objectAtIndex:indexPath.row];
    
    UIViewController *viewController;
    
    switch (model.viewControllerType) {
        case kViewControllerTypeYX:
        {
            YXGoodsViewController *goodsViewController = (YXGoodsViewController *)[NSClassFromString(model.viewControllerName) new];
            viewController = goodsViewController;
            goodsViewController.goods_id = 1149005;
        }
            break;
            
        default:
            break;
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - event response
#pragma mark - lazy loading

@end
