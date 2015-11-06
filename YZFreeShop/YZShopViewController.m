//
//  YZShopViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZShopViewController.h"
#import "NSDictionary+setNavigationBarTitleColor.h"
#import "YZShoppingData.h"
#import "YZBigDataTableViewCell.h"
#import "YZShoppingData.h"
#import "YZBigListData.h"
#import <MJRefresh/MJRefresh.h>

#define BigDataCellID @"BigDataCell"
#define ToDetailVC @"ToRecommendVC"


@interface YZShopViewController ()<UITableViewDataSource, UITableViewDelegate>{
    NSArray *_dataArray;
    
    __weak IBOutlet UITableView *_tableView;
}

@end

@implementation YZShopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary getNavigationBarTitleColorAttributes];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self loadRefresh];
    [_tableView.header beginRefreshing];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)loadRefresh{
    MJRefreshNormalHeader *normalHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [YZShoppingData getBigListDataWithCategory:BigListDataCategoryBoutique ComplationBlock:^(NSArray *array) {
            _dataArray = array;
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableView reloadData];
                [_tableView.header endRefreshing];
            });
        } failure:^(NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableView.header endRefreshing];
                [self.view showHUDView];
            });
        }];
    }];
    normalHeader.lastUpdatedTimeLabel.hidden = YES;
    _tableView.header = normalHeader;
}


#pragma mark - tableViewDelegate&dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YZBigDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BigDataCellID];
    return [cell bigDataCellWithData:[_dataArray objectAtIndex:indexPath.row]];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YZBigListData *data = [_dataArray objectAtIndex:indexPath.row];
    if ([data.type isEqualToString:@"搭配"]) {
        [self performSegueWithIdentifier:ToDetailVC  sender:self];
    }else{
        YZWebViewController *webVc = [self getWebViewControllerFromMainStoryBoard];
        webVc.RequestURLString = ShopLink([[_dataArray objectAtIndex:indexPath.row] num_iid]);
        [self.navigationController pushViewController:webVc animated:YES];
    }
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
