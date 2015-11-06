//
//  YZBigListData.h
//  YZFreeShop
//
//  Created by lunarboat on 15/11/2.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZBigListData : NSObject

@property (nonatomic, copy) NSString *old_price;

@property (nonatomic, copy) NSString *discribe;

@property (nonatomic, assign) NSInteger yijia_price;

@property (nonatomic, copy) NSString *sold;

@property (nonatomic, copy) NSString *time;

@property (nonatomic, copy) NSString *num_iid;

@property (nonatomic, copy) NSString *type;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, copy) NSString *now_price;

@property (nonatomic, assign) NSInteger more;

@property (nonatomic, copy) NSString *author;

@property (nonatomic, copy) NSString *link_url;

+ (YZBigListData *)parserDataFromDictionary:(NSDictionary *)dic;

@end

