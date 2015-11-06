//
//  YZSearchData.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/3.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZSearchData.h"

@implementation YZSearchData

+ (YZSearchData *)parserDataFromDictionary:(NSDictionary *)dic{
    YZSearchData *data = [[YZSearchData alloc]init];
    data.nick = [dic objectForKey:@"nick"];
    data.title = [dic objectForKey:@"title"];
    data.origin_price = [[dic objectForKey:@"price"]floatValue];
    data.pic_url = [dic objectForKey:@"pic_path"];
    data.now_price = [[dic objectForKey:@"price_with_rate"]floatValue];
    data.discount = [[dic objectForKey:@"discount"]floatValue];
    data.sold = [dic objectForKey:@"sold"];
    data.item_id = [dic objectForKey:@"item_id"];
    return data;
}

@end
