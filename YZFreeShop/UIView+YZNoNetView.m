//
//  UIView+YZNoNetView.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/2.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "UIView+YZNoNetView.h"

@implementation UIView (YZNoNetView)

- (MBProgressHUD *)showHUDView{
    MBProgressHUD *hud = [[MBProgressHUD alloc]initWithView:self];
    [self addSubview:hud];
    hud.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"noConnection"]];
    
    hud.mode = MBProgressHUDModeCustomView;
//    hud.delegate = self;
    
    /**
     * Called after the HUD was fully hidden from the screen.
     */
//    - (void)hudWasHidden:(MBProgressHUD *)hud;
    hud.labelText = @"无网络连接";
    hud.removeFromSuperViewOnHide = YES;
    [hud show:YES];
    [hud hide:YES afterDelay:3];
    return hud;
}
- (MBProgressHUD *)showLabel:(NSString *)string{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.mode = MBProgressHUDModeText;
    hud.labelText = string;
    hud.removeFromSuperViewOnHide = YES;
    
    [hud hide:YES afterDelay:3];
    return hud;
}

@end
