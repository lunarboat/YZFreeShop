//
//  YZAutoScrollView.h
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CWDAutoScrollView.h"


@interface YZAutoScrollView : UIScrollView

+ (CWDAutoScrollView *)autoScrollViewWithImageArray:(NSArray *)images;

@end
