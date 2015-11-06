//
//  YZSearchData.h
//  YZFreeShop
//
//  Created by lunarboat on 15/11/3.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZSearchData : NSObject

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, assign) float origin_price;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, assign) float now_price;

@property (nonatomic, assign) float discount;

@property (nonatomic, copy) NSString *sold;

@property (nonatomic, copy) NSString *item_id;

+ (YZSearchData *)parserDataFromDictionary:(NSDictionary *)dic;

@end
