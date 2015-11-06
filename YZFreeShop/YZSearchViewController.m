//
//  YZSearchViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZSearchViewController.h"
#import "NSDictionary+setNavigationBarTitleColor.h"
#import "YZImageItem.h"
#import "YZMainSearchData.h"
#import "YZListDataCellTableViewCell.h"

#import <MJRefresh/MJRefresh.h>
#define BuyTypeItemID @"BuyTypeItem"

#define ItemToEdge 20.0
#define ItemToItem 20.0
#define RowItemNumber 2
#define ViewSize self.view.bounds.size
#define HomePageTableViewTag 11
#define RowHeight 101

@interface YZSearchViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UITableViewDataSource, UITableViewDelegate>{
    NSArray *_dataArray;
    NSInteger _selectedItem;
    __weak IBOutlet UITableView *_tableView;
}
@property (copy, nonatomic) NSMutableArray *imageBtnArray;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end

@implementation YZSearchViewController

#pragma mark - ViewControllerCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary getNavigationBarTitleColorAttributes];
    
    [self loadData];
    [_tableView.header beginRefreshing];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - initial

- (NSMutableArray *)imageBtnArray{
    _imageBtnArray = [[NSMutableArray alloc]init];
    for (int i=0; i<8; i++) {
        [_imageBtnArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"ss%d",i]]];
    }
    return _imageBtnArray;
}

- (void)loadData{
    MJRefreshNormalHeader *normalHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [YZMainSearchData getMainSearchDataComplationBlock:^(NSArray *array) {
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
        });
    }];
    normalHeader.lastUpdatedTimeLabel.hidden = YES;
    _tableView.header = normalHeader;
}

#pragma mark - collectionViewDelegate&dataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageBtnArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YZImageItem *item = [collectionView dequeueReusableCellWithReuseIdentifier:BuyTypeItemID forIndexPath:indexPath];
    item.btnImageItem.image = [_imageBtnArray objectAtIndex:indexPath.item];

    return item;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGSize size = CGSizeMake((ViewSize.width - 2 * ItemToEdge - (RowItemNumber-1)* ItemToItem) / RowItemNumber, 0);
    size.height = size.width / 2;
    return size;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"%ld",indexPath.row);
    _selectedItem = indexPath.row;
    [self performSegueWithIdentifier:@"ToKindOfSearchVC" sender:self];
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return _collectionView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return _collectionView.bounds.size.height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YZWebViewController *webVc = [self getWebViewControllerFromMainStoryBoard];
    webVc.RequestURLString = ShopLink([[_dataArray objectAtIndex:indexPath.row] item_id]);
    [self.navigationController pushViewController:webVc animated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ToKindOfSearchVC"]) {
        id vc = [segue destinationViewController];
        [vc setValue:[NSNumber numberWithInteger:_selectedItem] forKey:@"selectedIndex"];
    }
}


@end
