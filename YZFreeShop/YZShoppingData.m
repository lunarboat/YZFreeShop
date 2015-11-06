//
//  YZShoppingData.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/2.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZShoppingData.h"
#import "YZAccessNet.h"
#import "YZBigListData.h"

#define BigListURLString(category) [NSString stringWithFormat:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/chaozhigou/zhidemai_show.php?type=%ld&app_id=246706046&app_oid=315bfdfecebdc556f2a4a1c64fde9a8781f576f1&app_version=2.0.1&app_channel=appstore&sche=jkjby",category]

@implementation YZShoppingData
+ (void)getBigListDataWithCategory:(BigListDataCategory)category ComplationBlock:(void (^)(NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock{
    [YZAccessNet getDataFromURLString:BigListURLString(category) parameters:nil complationBlock:^(NSData *data) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dictionary objectForKey:@"data"];
        NSMutableArray *dataArr = [[NSMutableArray alloc]initWithCapacity:array.count];
        for (NSDictionary *dic in array) {
            YZBigListData *data = [YZBigListData parserDataFromDictionary:dic];
            [dataArr addObject:data];
        }
        complationBlock(dataArr);
    } failure:^(NSError *error) {
//        NSLog(@"getBigListDataError:%@", error);
        failureBlock(error);
    }];
}

@end
