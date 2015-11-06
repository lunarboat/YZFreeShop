//
//  YZHomeViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZHomeViewController.h"
#import "NSDictionary+setNavigationBarTitleColor.h"
#import "YZHomeData.h"
#import "YZScrollImageData.h"
#import "YZListData.h"
#import "YZListDataCellTableViewCell.h"
#import <MJRefresh.h>
#define NavigationBarHeight 64

@interface YZHomeViewController (){
    NSArray *_autoImages;
    NSArray *_dataArray;
    __weak IBOutlet UITableView *_tableView;
    __weak IBOutlet UIView *_autoView;
}

@property (nonatomic, strong)  UIPageControl *pageControl;

@end

@implementation YZHomeViewController

#pragma mark - ViewControllerCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary getNavigationBarTitleColorAttributes];
    
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self loadRefresh];
    [_tableView.header beginRefreshing];
}
- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
    self.tabBarController.tabBar.hidden = NO;
}

- (UIPageControl *)pageControl{
    _pageControl = [[UIPageControl alloc] init];
    _pageControl.userInteractionEnabled = NO;
    [_autoView addSubview:_pageControl];
    return _pageControl;
}

#pragma mark 加载滚动视图
- (void)loadAutoScroll{
    if (_autoView.subviews.count > 0) {
        for (UIView *subView in _autoView.subviews) {
            [subView removeFromSuperview];
        }
    }
    NSMutableArray *images = [[NSMutableArray alloc]initWithCapacity:_autoImages.count];
    for (YZScrollImageData *imageData in _autoImages) {
        [images addObject:imageData.iphoneimg];
    }
    
    CWDAutoScrollView *autoScrollView = [YZAutoScrollView autoScrollViewWithImageArray:images];
    autoScrollView.autoScrollDelegate = self;
    [_autoView addSubview:autoScrollView];
    
    self.pageControl.frame = CGRectMake(0, 0, autoScrollView.width, 10);
    _pageControl.centerX = autoScrollView.centerX;
    _pageControl.centerY = autoScrollView.bottom - 10;
    _pageControl.numberOfPages = images.count;
    
    
}
#pragma mark 加载刷新
- (void)loadRefresh{
    _tableView.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
    MJRefreshNormalHeader *normalHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            //加载scrollView视图数据的block
            [YZHomeData getScrollDatawithComplationBlock:^(NSArray *array) {
                _autoImages = array;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self loadAutoScroll];
                });
            } failure:^(NSError *error) {
                
            }];
            //加载tableView表数据的block
            [YZHomeData getListDataWithListNumber:0 ComplationBlock:^(NSArray *array) {
                _dataArray = array;
                dispatch_async(dispatch_get_main_queue(), ^{
                    [_tableView reloadData];
                    [_tableView.header endRefreshing];
                });
            } failure:^(NSError *error) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.view showHUDView];
                    [_tableView.header endRefreshing];
                });
            }];
        });
    }];
    normalHeader.lastUpdatedTimeLabel.hidden = YES;
    _tableView.header = normalHeader;
}



#pragma mark - AutoScrollViewDelegate
- (void)scrollImageClick:(NSInteger)index{
    YZWebViewController *webVc = [self getWebViewControllerFromMainStoryBoard];
    webVc.RequestURLString = [[_autoImages objectAtIndex:index]link];
    [self.navigationController pushViewController:webVc animated:YES];
    
}
- (void)updatePageControlNum:(NSInteger)index{
    _pageControl.currentPage = index;
}

#pragma mark - TableViewDataSource&delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"listDataCell";
    YZListDataCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    return [cell listDataCell:cell withData:[_dataArray objectAtIndex:indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return;
    }
    YZWebViewController *webVc = [self getWebViewControllerFromMainStoryBoard];
    webVc.RequestURLString = ShopLink([[_dataArray objectAtIndex:indexPath.row] num_iid]);
    [self.navigationController pushViewController:webVc animated:YES];
}

#pragma mark - ActionTargetMethod
- (IBAction)searchBtnItem:(id)sender {
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
