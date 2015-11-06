//
//  YZTableView.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/31.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZTableView.h"
#import "YZListDataCellTableViewCell.h"
#import "UIView+YZExtend.h"
#import "YZListData.h"
#define HomePageTableViewTag 11
#define RowHeight 101

@interface YZTableView(){
    NSArray *_array;
}

@end
@implementation YZTableView

- (void)dataArray:(NSArray *)dataArray{
    _array = dataArray;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellID = @"listDataCell";
    YZListDataCellTableViewCell *cell = [[[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:@"HomePageVC"].view viewWithTag:HomePageTableViewTag] dequeueReusableCellWithIdentifier:cellID];
    return [cell listDataCell:cell withData:[_array objectAtIndex:indexPath.row]];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return RowHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YZWebViewController *webVc = [[self viewController] getWebViewControllerFromMainStoryBoard];
    webVc.RequestURLString = ShopLink([[_array objectAtIndex:indexPath.row] num_iid]);
    [[self viewController].navigationController pushViewController:webVc animated:YES];
}

@end
