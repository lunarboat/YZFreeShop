//
//  NSDictionary+setNavigationBarTitleColor.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "NSDictionary+setNavigationBarTitleColor.h"

@implementation NSDictionary (setNavigationBarTitleColor)

+ (NSDictionary *)getNavigationBarTitleColorAttributes{
    NSDictionary *dict = [NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    return dict;
}

@end
