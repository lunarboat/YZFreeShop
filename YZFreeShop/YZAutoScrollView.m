//
//  YZAutoScrollView.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZAutoScrollView.h"

@implementation YZAutoScrollView

+ (CWDAutoScrollView *)autoScrollViewWithImageArray:(NSArray *)images{
    CWDAutoScrollView *autoScroll = [[CWDAutoScrollView alloc]init];
    autoScroll.viewHeight = 100.0;
    [autoScroll updateViewWithImageArray:images];
    autoScroll.infiniteScrolling = YES;
    [autoScroll startAutoScrollWithInterval:3.0];
    
    return autoScroll;
}


@end
