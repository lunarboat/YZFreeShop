//
//  YZWebViewController.h
//  YZFreeShop
//
//  Created by lunarboat on 15/11/4.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YZWebViewController : UIViewController

@property (nonatomic, copy) NSString *RequestURLString;

/**
 *  加载一个网页从请求里
 *
 *  @param URLString 请求地址字符串
 */
- (void)loadPageFromURLString;

/**
 *  加载一个网页从一大串HTML的字符串
 *
 *  @param HTMLString    HTML字符串
 *  @param baseURLString 可以加载本地获网络的样式
 */
- (void)loadPageFromHTMLString:(NSString *)HTMLString baseURLString:(NSString *)baseURLString;
@end
