//
//  YZTableView.h
//  YZFreeShop
//
//  Created by lunarboat on 15/10/31.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZTableView : UITableView<UITableViewDelegate, UITableViewDataSource>

- (void)dataArray:(NSArray *)dataArray;

@property (nonatomic, assign) BOOL isLoading;

@end
