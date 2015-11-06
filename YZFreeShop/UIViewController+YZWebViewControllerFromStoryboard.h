//
//  UIViewController+YZWebViewControllerFromStoryboard.h
//  YZFreeShop
//
//  Created by lunarboat on 15/11/4.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YZWebViewController.h"

@interface UIViewController (YZWebViewControllerFromStoryboard)

- (YZWebViewController *)getWebViewControllerFromMainStoryBoard;

@end
