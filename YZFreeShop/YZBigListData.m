//
//  YZBigListData.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/2.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZBigListData.h"

@implementation YZBigListData

+ (YZBigListData *)parserDataFromDictionary:(NSDictionary *)dic{
    YZBigListData *data = [[YZBigListData alloc]init];
    data.type = [dic objectForKey:@"type"];
    data.title = [dic objectForKey:@"title"];
    data.more = [[dic objectForKey:@"more"]integerValue];
    data.time = [dic objectForKey:@"time"];
    data.now_price = [dic objectForKey:@"now_price"];
    data.yijia_price = [[dic objectForKey:@"yijia_price"]integerValue];
    data.old_price = [dic objectForKey:@"old_price"];
    data.sold = [dic objectForKey:@"sold"];
    data.pic_url = [dic objectForKey:@"pic_url"];
    data.discribe = [dic objectForKey:@"discribe"];
    data.num_iid = [dic objectForKey:@"num_iid"];
    if ([data.type isEqualToString:@"搭配"]) {
        //搭配特有的数据
        data.source = [dic objectForKey:@"source"];
        data.link_url = [dic objectForKey:@"link_url"];
    }else if ([data.type isEqualToString:@"精品"]){
        //精品特有的数据
        data.author = [dic objectForKey:@"author"];
    }
    return data;
}

@end


