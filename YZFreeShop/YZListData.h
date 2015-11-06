//
//  YZListData.h
//  YZFreeShop
//
//  Created by lunarboat on 15/10/31.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZListData : NSObject


@property (nonatomic, assign) float discount;

@property (nonatomic, copy) NSString *start_discount;

@property (nonatomic, copy) NSString *num_iid;

@property (nonatomic, copy) NSString *show_time;

@property (nonatomic, assign) BOOL is_vip_price;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, assign) BOOL is_onsale;

@property (nonatomic, assign) NSInteger total_love_number;

@property (nonatomic, copy) NSString *rp_type;

@property (nonatomic, assign) float now_price;

@property (nonatomic, assign) float origin_price;

@property (nonatomic, assign) NSInteger total_hate_number;

@property (nonatomic, assign) BOOL is_buy_sale;

@property (nonatomic, copy) NSString *deal_num;

@property (nonatomic, assign) NSInteger ling_value;

@property (nonatomic, assign) NSInteger iid;

@property (nonatomic, copy) NSString *tag_name;

@property (nonatomic, copy) NSString *tag_color;

@property (nonatomic, assign) NSInteger cid;

@property (nonatomic, copy) NSString *rp_pic_url_hd;

+ (YZListData *)parserDataFromDictionary:(NSDictionary *)dic;
+ (YZListData *)parserDataTwoFromDictionary:(NSDictionary *)dic;
+ (YZListData *)parserDataThreeFromDictionary:(NSDictionary *)dic;
@end
