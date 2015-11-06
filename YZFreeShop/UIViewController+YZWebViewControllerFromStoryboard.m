//
//  UIViewController+YZWebViewControllerFromStoryboard.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/4.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "UIViewController+YZWebViewControllerFromStoryboard.h"
#define CustomWebViewID @"CustomWebView"

@implementation UIViewController (YZWebViewControllerFromStoryboard)

- (YZWebViewController *)getWebViewControllerFromMainStoryBoard{
    return [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]]instantiateViewControllerWithIdentifier:CustomWebViewID];
}

@end
