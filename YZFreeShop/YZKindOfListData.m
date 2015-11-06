//
//  YZKindOfListData.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/5.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZKindOfListData.h"

@implementation YZKindOfListData

+ (YZKindOfListData *)parserDataFromDictionary:(NSDictionary *)dic{
    YZKindOfListData *data = [[YZKindOfListData alloc]init];
    data.name = [dic objectForKey:@"name"];
    data.cid = [dic objectForKey:@"cid"];
    return data;
}

@end
