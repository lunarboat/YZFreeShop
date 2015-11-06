//
//  YZEveryDayViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/6.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZEveryDayViewController.h"
#import "NSDictionary+setNavigationBarTitleColor.h"
#import "YZGetSlideData.h"
#import <MJRefresh/MJRefresh.h>
#import "YZHomeData.h"
#import "YZListData.h"

@interface YZEveryDayViewController ()

@end

@implementation YZEveryDayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.labelTitle;
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary getNavigationBarTitleColorAttributes];
}
- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
}

- (void)loadData{
    if ([self.labelTitle isEqualToString:@"每日推荐"]) {
        [YZGetSlideData getEveryDayDataWithComplationBlock:^(NSArray *array) {
            self.dataArray = array;
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
    }else if([self.labelTitle isEqualToString:@"明日预告"]){
        [YZGetSlideData getTomorrowDataWithComplationBlock:^(NSArray *array) {
            self.dataArray = array;
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
    }else if ([self.labelTitle isEqualToString:@"9.9包邮"]){
        [YZHomeData getListDataWithListNumber:0 ComplationBlock:^(NSArray *array) {
            NSMutableArray *nineArray = [[NSMutableArray alloc]init];
            [array enumerateObjectsUsingBlock:^(YZListData *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (obj.now_price < 10.0) {
                    [nineArray addObject:obj];
                }
            }];
            self.dataArray = nineArray;
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
    }else{
        [self.tableView.header endRefreshing];
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.labelTitle isEqualToString:@"每日推荐"]) {
        if (indexPath.row == 0) {
            return;
        }
    }
    YZWebViewController *webVc = [self getWebViewControllerFromMainStoryBoard];
    webVc.RequestURLString = ShopLink([[self.dataArray objectAtIndex:indexPath.row] num_iid]);
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
