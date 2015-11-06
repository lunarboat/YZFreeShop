//
//  YZSuperViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZSuperViewController.h"
#import "NSDictionary+setNavigationBarTitleColor.h"
#import "YZTableView.h"
#import "YZSuperData.h"
#import <MJRefresh/MJRefresh.h>

#define ViewSize self.view.bounds.size

@interface YZSuperViewController ()<HTHorizontalSelectionListDataSource, HTHorizontalSelectionListDelegate, UIScrollViewDelegate>{
    
    NSArray *_listArray;
    NSMutableArray *_viewArray;
    NSArray *_dataArray;
    
}
@property (nonatomic, weak) IBOutlet HTHorizontalSelectionList *selectionList;
@property (nonatomic, weak) IBOutlet UIScrollView *allScrollView;
@property (nonatomic, assign) NSInteger index;

@end

@implementation YZSuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary getNavigationBarTitleColorAttributes];
    [self loadHorizontalSelectionList];
    _allScrollView.contentInset = UIEdgeInsetsMake(94, 0, 44, 0);
    _allScrollView.contentSize = CGSizeMake(ViewSize.width * _listArray.count, 0);
    [self loadDataListView];
    [self loadData];

}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (NSInteger)index{
    return (int)_allScrollView.contentOffset.x / (int)ViewSize.width;
}


- (void)loadDataListView{
    _viewArray = [[NSMutableArray alloc]initWithCapacity:_listArray.count];
    for (int i=0; i<_listArray.count; i++) {
        YZTableView *tableview = [[YZTableView alloc]initWithFrame:CGRectMake(ViewSize.width * i, 0, ViewSize.width, ViewSize.height - 30 - 64) style:UITableViewStylePlain];
        tableview.contentInset = UIEdgeInsetsMake(0, 0, 44, 0);
        tableview.backgroundColor = [UIColor colorWithRed:250.0/255 green:250.0/255 blue:250.0/255 alpha:1];
        [tableview setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [_allScrollView addSubview:tableview];
        [_viewArray addObject:tableview];
    }
    
}

- (void)loadData{
    YZTableView *currentView = [_viewArray objectAtIndex:_index];
    if (currentView.isLoading == YES) {
        return;
    }
    currentView.delegate = currentView;
    currentView.dataSource = currentView;
    currentView.isLoading = YES;
    MJRefreshNormalHeader *normalHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //执行网络数据操作
        [YZSuperData getListDataWithListNumber:_index ComplationBlock:^(NSArray *array) {
            [currentView dataArray:array];
            dispatch_async(dispatch_get_main_queue(), ^{
                [currentView reloadData];
                [currentView.header endRefreshing];
                currentView.isLoading = NO;
            });
        } failure:^(NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [currentView.header endRefreshing];
                [self.view showHUDView];
            });
        }];
        
                                               
    }];
    normalHeader.lastUpdatedTimeLabel.hidden = YES;
    currentView.header = normalHeader;
    [currentView.header beginRefreshing];
}

- (void)loadHorizontalSelectionList{
    _selectionList.delegate = self;
    _selectionList.dataSource = self;
    _selectionList.selectionIndicatorColor = GetMainColor;
    _selectionList.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:0.8];
    [_selectionList setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    _listArray = [[NSMutableArray alloc]initWithObjects:@"全部", @"数码", @"女装", @"男装", @"家居", @"母婴", @"鞋包", @"配饰", @"美妆", @"美食", @"其他", nil];
    [self.view addSubview:_selectionList];
}

#pragma mark - HorizontalSelectionListDateSource&delegate
- (NSInteger)numberOfItemsInSelectionList:(HTHorizontalSelectionList *)selectionList{
    return _listArray.count;
}
- (NSString *)selectionList:(HTHorizontalSelectionList *)selectionList titleForItemWithIndex:(NSInteger)index{
    return [_listArray objectAtIndex:index];
}
- (void)selectionList:(HTHorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index{
//    NSLog(@"%ld",(long)index);
    [_allScrollView setContentOffset:CGPointMake(index * ViewSize.width, _allScrollView.frame.origin.y - 94) animated:YES];
    _index = index;
    [self loadData];
}

#pragma mark - scrollViewDelegate
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSInteger index = (int)targetContentOffset->x / (int)ViewSize.width;
    [_selectionList setSelectedButtonIndex:index animated:YES];
    _index = index;
    YZTableView *tableView = _viewArray[index];
    UITableViewCell *cell =[tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    if (!cell) {
        [self loadData];
//        NSLog(@"contentSize:%@", NSStringFromCGSize(tableView.contentSize));
    }
//    [tableView.header endRefreshing];
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
