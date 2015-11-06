//
//  YZKindOfSearchViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/5.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZKindOfSearchViewController.h"
#import <HTHorizontalSelectionList.h>
#import "YZMainSearchData.h"

@interface YZKindOfSearchViewController ()<HTHorizontalSelectionListDataSource, HTHorizontalSelectionListDelegate, UITableViewDataSource, UITableViewDelegate>{
    NSArray *_listArray;
    __weak IBOutlet UITableView *_tableView;
}
@property (weak, nonatomic) IBOutlet HTHorizontalSelectionList *listView;

@end

@implementation YZKindOfSearchViewController
#pragma mark - viewControllerLifeCycle
- (void)viewDidLoad{
    [super viewDidLoad];
    NSLog(@"接收的索引%ld",self.selectedIndex);
    if (_selectedIndex > 0) {
        [self loadData];
    }
    
}

- (void)loadData{
    [YZMainSearchData getKindListDataWithKind:self.selectedIndex - 1 ComplationBlock:^(NSArray *array) {
        _listArray = array;
        dispatch_async(dispatch_get_main_queue(), ^{
           [self.listView reloadData];
        });
    } failure:^(NSError *error) {
        [self.view showLabel:@"请求错误"];
    }];
}

- (HTHorizontalSelectionList *)listView{
    _listView.delegate = self;
    _listView.dataSource = self;
    _listView.selectionIndicatorColor = GetMainColor;
    _listView.backgroundColor = [UIColor colorWithRed:250/255.0 green:250/255.0 blue:250/255.0 alpha:0.8];
    [_listView setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    return _listView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - HTHorizontalSelectionList delegate&dataSource
- (NSInteger)numberOfItemsInSelectionList:(HTHorizontalSelectionList *)selectionList{
    return _listArray.count;
    return 10;
}
- (NSString *)selectionList:(HTHorizontalSelectionList *)selectionList titleForItemWithIndex:(NSInteger)index{
#warning NoExecute
    return [_listArray[index] name];
}
- (void)selectionList:(HTHorizontalSelectionList *)selectionList didSelectButtonWithIndex:(NSInteger)index{
    NSLog(@"%ld",index);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchKindCell" forIndexPath:indexPath];
 
 return cell;
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
