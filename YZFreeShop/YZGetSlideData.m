//
//  YZGetSlideData.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/6.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZGetSlideData.h"
#import "YZAccessNet.h"
#import "YZListData.h"

#define EveryDayDataLink @"http://app.api.repaiapp.com/sx/songshijie/goods/get.php?app_id=246706046&app_oid=b883a62174cd79613d40d7ba300cb9a65d1223c6&app_version=2.0.1&app_channel=appstore&sche=jkjby"
#define TomorrowDataLink @"http://jkjby.repaiapp.com/jkjby/view/tomorrow_api.php?app_id=246706046&app_oid=b883a62174cd79613d40d7ba300cb9a65d1223c6&app_version=2.0.1&app_channel=appstore&sche=jkjby"

@implementation YZGetSlideData

+ (void)getEveryDayDataWithComplationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock{
    [YZAccessNet getDataFromURLString:EveryDayDataLink parameters:nil complationBlock:^(NSData *data) {
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        NSArray *array = [dictionary objectForKey:@"list"];
        NSMutableArray *dataArr = [[NSMutableArray alloc]initWithCapacity:array.count];
        for (NSDictionary *dic in array) {
            YZListData *data = [YZListData parserDataThreeFromDictionary:dic];
            [dataArr addObject:data];
        }
        complationBlock(dataArr);
        
    }failure:^(NSError *error) {
        failureBlock(error);
    }];
}

+ (void)getTomorrowDataWithComplationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock{
    [YZAccessNet getDataFromURLString:TomorrowDataLink parameters:nil complationBlock:^(NSData *data) {
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        NSArray *array = [dictionary objectForKey:@"list"];
        NSMutableArray *dataArr = [[NSMutableArray alloc]initWithCapacity:array.count];
        for (NSDictionary *dic in array) {
            YZListData *data = [YZListData parserDataFromDictionary:dic];
            [dataArr addObject:data];
        }
        complationBlock(dataArr);
        
    }failure:^(NSError *error) {
        failureBlock(error);
    }];
}

@end
