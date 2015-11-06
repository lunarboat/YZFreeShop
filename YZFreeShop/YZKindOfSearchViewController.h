//
//  YZKindOfSearchViewController.h
//  YZFreeShop
//
//  Created by lunarboat on 15/11/5.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SearchType) {
    SearchTypeNINEDOTNINE = 0,
    SearchTypeGIRLS,
    SearchTypeBABY,
    SearchTypeELECTRICAL,
    SearchTypeFOOD,
    SearchTypeHOME,
    SearchTypeMALE,
    SearchTypeFEMALE
};

@interface YZKindOfSearchViewController : UIViewController

@property (nonatomic, assign) NSInteger selectedIndex;

@end
