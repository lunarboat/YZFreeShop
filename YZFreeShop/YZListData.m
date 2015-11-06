//
//  YZListData.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/31.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZListData.h"

@implementation YZListData

+ (YZListData *)parserDataFromDictionary:(NSDictionary *)dic{
    YZListData *listData = [[YZListData alloc]init];
    listData.rp_type = [dic objectForKey:@"rp_type"];
    listData.num_iid = [dic objectForKey:@"num_iid"];
    listData.deal_num = [dic objectForKey:@"deal_num"];
    listData.title = [dic objectForKey:@"title"];
    listData.pic_url = [dic objectForKey:@"pic_url"];
    listData.now_price = [[dic objectForKey:@"now_price"]floatValue];
    listData.show_time = [dic objectForKey:@"show_time"];
    listData.origin_price = [[dic objectForKey:@"origin_price"]floatValue];
    listData.discount = [[dic objectForKey:@"discount"]floatValue];
    listData.start_discount = [dic objectForKey:@"start_discount"];
    listData.is_vip_price = [[dic objectForKey:@"is_vip_price"]boolValue];
    listData.ling_value = [[dic objectForKey:@"ling_value"]integerValue];
    listData.is_onsale = [[dic objectForKey:@"is_onsale"]boolValue];
    listData.total_love_number = [[dic objectForKey:@"total_love_number"]integerValue];
    listData.total_hate_number = [[dic objectForKey:@"total_hate_number"]integerValue];
    listData.is_buy_sale = [[dic objectForKey:@"is_buy_sale"]boolValue];
    return listData;
}
+ (YZListData *)parserDataTwoFromDictionary:(NSDictionary *)dic{
    YZListData *listData = [[YZListData alloc]init];
    listData.iid = [[dic objectForKey:@"iid"]integerValue];
    listData.num_iid = [dic objectForKey:@"rp_iid"];
    listData.now_price = [[dic objectForKey:@"rp_price"]floatValue];
    listData.origin_price = [[dic objectForKey:@"rp_old_price"] floatValue];
    listData.pic_url = [dic objectForKey:@"rp_pic_url"];
    listData.rp_pic_url_hd = [dic objectForKey:@"rp_pic_url_hd"];
    listData.cid = [[dic objectForKey:@"cid"]integerValue];
    listData.discount = [[dic objectForKey:@"rp_discount"]floatValue];
    listData.title = [dic objectForKey:@"rp_title"];
    listData.deal_num = [dic objectForKey:@"rp_sold"];
    listData.rp_type = [dic objectForKey:@"type"];
    listData.show_time = [dic objectForKey:@"start_time"];
    listData.tag_name = [dic objectForKey:@"tag_name"];
    listData.tag_color = [dic objectForKey:@"tag_color"];
    return listData;
}

+ (YZListData *)parserDataThreeFromDictionary:(NSDictionary *)dic{
    YZListData *listData = [[YZListData alloc]init];
    listData.num_iid = [dic objectForKey:@"id"];
    listData.title = [dic objectForKey:@"title"];
    listData.pic_url = [dic objectForKey:@"pic_url"];
    listData.now_price = [[dic objectForKey:@"n_price"]floatValue];
    listData.origin_price = [[dic objectForKey:@"o_price"]floatValue];
    listData.deal_num = [dic objectForKey:@"sold_volu"];
    listData.discount = [[dic objectForKey:@"discount"]floatValue];
    return listData;
}

@end
