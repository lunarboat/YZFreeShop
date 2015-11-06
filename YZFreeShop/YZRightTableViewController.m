//
//  YZRightTableViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/5.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZRightTableViewController.h"

@interface YZRightTableViewController (){
    id vc;
}

@property (nonatomic, copy) NSString *selectedTitle;

@end

@implementation YZRightTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    if (indexPath.row > 0) {
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        self.selectedTitle = cell.textLabel.text;
    }else{
        self.selectedTitle = @"一折包邮";
    }
    [vc setValue:_selectedTitle forKey:@"labelTitle"];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"TableMenu"]) {
        UINavigationController *nav = segue.destinationViewController;
        vc = nav.viewControllers[0];
    }  
}


@end
