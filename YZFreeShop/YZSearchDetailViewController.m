//
//  YZSearchDetailViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/3.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZSearchDetailViewController.h"
#define ClearCellID @"ClearCell"
#define SearchCellID @"SearchHistoryCell"

@interface YZSearchDetailViewController ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>{
    __weak IBOutlet UITextField *_inputTextField;
    __weak IBOutlet UITableView *_historySearchTable;
    
}
@property (nonatomic, strong) NSMutableArray *searchHistoryList;

@end

@implementation YZSearchDetailViewController

#pragma mark - ViewControllerCycle
- (void)viewDidLoad{
    [super viewDidLoad];
    [self searchHistoryList];
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
}

- (NSMutableArray *)searchHistoryList{
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self getFilePath]]) {
         _searchHistoryList = [NSMutableArray arrayWithContentsOfFile:[self getFilePath]];
    }else{
        _searchHistoryList = [[NSMutableArray alloc]init];
    }
    return _searchHistoryList;
}

#pragma mark - action-target
- (IBAction)backBtnClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)clearSearchHistory:(id)sender {
    [_searchHistoryList removeAllObjects];
    if ([[NSFileManager defaultManager] fileExistsAtPath:[self getFilePath]]) {
        [[NSFileManager defaultManager] removeItemAtPath:[self getFilePath] error:nil];
    }
    [_historySearchTable reloadData];
}

#pragma mark - tableViewDelegate&dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return 1;
    }else{
        return _searchHistoryList.count;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = nil;
    if (indexPath.section == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:ClearCellID];
    }else{
        cell = [tableView dequeueReusableCellWithIdentifier:SearchCellID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SearchCellID];
        }
        cell.textLabel.text = [_searchHistoryList objectAtIndex:indexPath.row];
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *selectedCell = [tableView cellForRowAtIndexPath:indexPath];
    _inputTextField.text = selectedCell.textLabel.text;
    [self performSegueWithIdentifier:@"ToSearchItemVC" sender:self];
}

#pragma mark - textFieldDelegate 
- (BOOL)textFieldShouldReturn:(UITextField *)textField{

    //操作数组
    [_searchHistoryList addObject:textField.text];
    //操作文件
    [_searchHistoryList writeToFile:[self getFilePath] atomically:YES];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [_historySearchTable insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    [textField resignFirstResponder];
    //跳转界面
    [self performSegueWithIdentifier:@"ToSearchItemVC" sender:self];
    return YES;
}

- (NSString *)getFilePath{
    NSString *documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)firstObject];
    return [documentsPath stringByAppendingPathComponent:@"historysearch.plist"];
}


#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    [_inputTextField resignFirstResponder];
    if ([segue.identifier isEqualToString:@"ToSearchItemVC"]) {
        id vc = segue.destinationViewController;
        [vc setValue:_inputTextField.text forKey:@"searchString"];
    }
}

@end
