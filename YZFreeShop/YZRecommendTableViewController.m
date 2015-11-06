//
//  YZRecommendTableViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/2.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZRecommendTableViewController.h"
#import "NSDictionary+setNavigationBarTitleColor.h"
#import <MJRefresh/MJRefresh.h>
#import "YZShoppingData.h"
#import "YZBigDataTableViewCell.h"

#define BigDataDetailCellID @"BigDataDetailCell"

@interface YZRecommendTableViewController ()<UITableViewDataSource, UITableViewDelegate>{
    
    NSArray *_dataArray;
    IBOutlet UITableView *_tableView;
}

@end

@implementation YZRecommendTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary getNavigationBarTitleColorAttributes];
    [self loadRefresh];
    [_tableView.header beginRefreshing];
}

- (void)loadRefresh{
    MJRefreshNormalHeader *normalHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [YZShoppingData getBigListDataWithCategory:BigListDataCategoryRecommend ComplationBlock:^(NSArray *array) {
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

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YZBigDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:BigDataDetailCellID];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"YZBigDataTableViewCell" owner:self options:nil]firstObject];
    }
    
    return [cell bigDataCellWithData:[_dataArray objectAtIndex:indexPath.row]];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [UIScreen mainScreen].bounds.size.width + 63;
}

@end
