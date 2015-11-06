//
//  YZSearchItemTableViewController.h
//  YZFreeShop
//
//  Created by lunarboat on 15/11/5.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZSearchItemTableViewController : UITableViewController

@property (nonatomic, copy) NSString *searchString;
@property (nonatomic, copy) NSArray *dataArray;
/**
 *  根据URL加载数据的方法
 */
- (void)loadData;

@end
