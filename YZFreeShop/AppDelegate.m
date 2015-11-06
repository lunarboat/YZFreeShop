//
//  AppDelegate.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/29.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "AppDelegate.h"
#import <AFNetworking/AFNetworkReachabilityManager.h>

#define NoDataImageViewWidthAndHeight self.window.bounds.size.width/2

@interface AppDelegate (){
    UIImageView *noDataImageView;
    AFNetworkReachabilityStatus _lastStatus;
}

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _lastStatus = AFNetworkReachabilityStatusUnknown;
    [self networkReachability];
    return YES;
}

/**
 *  监控网络操作
 */
- (void)networkReachability{
    [[AFNetworkReachabilityManager sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {
//            NSLog(@"没网，更新没网状态下的UI");
            if (noDataImageView == nil) {
                noDataImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noDataImage"]];
                noDataImageView.frame = CGRectMake(0, 0, NoDataImageViewWidthAndHeight, NoDataImageViewWidthAndHeight);
                noDataImageView.center = self.window.center;
                [self.window addSubview:noDataImageView];
            }
        }else{
//            NSLog(@"有网,状态%ld",(long)status);
            if (noDataImageView != nil) {
                [noDataImageView removeFromSuperview];
                noDataImageView = nil;
            }
            if (_lastStatus == AFNetworkReachabilityStatusNotReachable) {
//                NSLog(@"上一次没网");
                [self.window showLabel:@"网络恢复 试试重新加载"];
            }
        }
        _lastStatus = status;
    }];
    [[AFNetworkReachabilityManager sharedManager]startMonitoring];

}

@end
