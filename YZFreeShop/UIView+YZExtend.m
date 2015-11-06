//
//  UIView+YZExtend.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/5.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "UIView+YZExtend.h"

@implementation UIView (YZExtend)

- (UIViewController*)viewController {
    for (UIView *next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

@end
