//
//  YZPayViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/6.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZPayViewController.h"
#import "NSDictionary+setNavigationBarTitleColor.h"

#define payTaobaoLink @"http://h5.m.taobao.com/app/cz/cost.html?pid=mm_25856670_0_0&unid=cvHiXDYH6v62&backHiddenFlag=1&v=0"
@interface YZPayViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *customWebView;

@end

@implementation YZPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary getNavigationBarTitleColorAttributes];
    self.tabBarController.tabBar.hidden = YES;
    [self loadPageFromURLString];
    
}
- (void)loadPageFromURLString{
    [self.customWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:payTaobaoLink]]];
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
