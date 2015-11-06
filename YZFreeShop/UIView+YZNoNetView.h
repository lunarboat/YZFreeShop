//
//  UIView+YZNoNetView.h
//  YZFreeShop
//
//  Created by lunarboat on 15/11/2.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIView (YZNoNetView)

- (MBProgressHUD *)showHUDView;

- (MBProgressHUD *)showLabel:(NSString *)string;

@end
