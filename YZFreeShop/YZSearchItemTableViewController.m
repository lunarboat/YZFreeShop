//
//  YZSearchItemTableViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/5.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZSearchItemTableViewController.h"
#import "YZMainSearchData.h"
#import "YZListDataCellTableViewCell.h"
#import "YZListData.h"
#define HomePageTableViewTag 11
#define RowHeight 101
#import <MJRefresh.h>

@interface YZSearchItemTableViewController ()
@end

@implementation YZSearchItemTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.searchString;
    [self refreshData];
    [self.tableView.header beginRefreshing];
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}

- (void)refreshData{
    MJRefreshNormalHeader *normalHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self loadData];
    }];
    normalHeader.lastUpdatedTimeLabel.hidden = YES;
    self.tableView.header = normalHeader;
}

- (void)loadData{
    [YZMainSearchData getSearchItemListWithSearchItem:self.searchString complationBlock:^(NSArray *array) {
        _dataArray = array;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
            [self.tableView.header endRefreshing];
        });
    } failure:^(NSError *error) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView.header endRefreshing];
            [self.view showHUDView];
        });
    }];
}



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"listDataCell";
    YZListDataCellTableViewCell *cell = [[[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HomePageVC"].view viewWithTag:HomePageTableViewTag] dequeueReusableCellWithIdentifier:cellID];
    return [cell listDataCell:cell withData:[_dataArray objectAtIndex:indexPath.row]];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return RowHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YZWebViewController *webVc = [self getWebViewControllerFromMainStoryBoard];
    webVc.RequestURLString = ShopLink2([[_dataArray objectAtIndex:indexPath.row] num_iid]);
    [self.navigationController pushViewController:webVc animated:YES];
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
