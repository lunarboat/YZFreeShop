//
//  YZTabBarViewController.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/29.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZTabBarViewController.h"

@interface YZTabBarViewController ()

@end

@implementation YZTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITabBarItem *tabBarItem1 = [self.tabBar.items objectAtIndex:0];
    tabBarItem1.selectedImage = [[UIImage imageNamed:@"home"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *tabBarItem2 = [self.tabBar.items objectAtIndex:1];
    tabBarItem2.selectedImage = [[UIImage imageNamed:@"super"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *tabBarItem3 = [self.tabBar.items objectAtIndex:2];
    tabBarItem3.selectedImage = [[UIImage imageNamed:@"shopping"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *tabBarItem4 = [self.tabBar.items objectAtIndex:3];
    tabBarItem4.selectedImage = [[UIImage imageNamed:@"search"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *tabBarItem5 = [self.tabBar.items objectAtIndex:4];
    tabBarItem5.selectedImage = [[UIImage imageNamed:@"member"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

@end
