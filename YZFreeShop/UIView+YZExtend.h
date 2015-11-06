//
//  UIView+YZExtend.h
//  YZFreeShop
//
//  Created by lunarboat on 15/11/5.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (YZExtend)
/**
 *  获取view所在的视图控制器
    以消息响应者链为根据
 *
 *  @return 视图控制器
 */
- (UIViewController *)viewController;

@end
