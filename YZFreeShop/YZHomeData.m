//
//  YZHomeData.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZHomeData.h"
#import "YZAccessNet.h"
#import "YZScrollImageData.h"
#import "YZListData.h"

#define ScrollImageURLString @"http://cloud.repaiapp.com/yunying/zhuanti.php?&app_id=246706046&app_oid=315bfdfecebdc556f2a4a1c64fde9a8781f576f1&app_version=2.0.1&app_channel=appstore&sche=jkjby"
#define ListURLString(category,ID) [NSString stringWithFormat:@"http://jkjby.repaiapp.com/jkjby/view/%@.php?cid=%ld&app_id=246706046&app_oid=315bfdfecebdc556f2a4a1c64fde9a8781f576f1&app_version=2.0.1&app_channel=appstore&sche=jkjby",category, listNumber]

@interface YZHomeData ()

@end

@implementation YZHomeData

+ (void)getScrollDatawithComplationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock{
//    http://cloud.repaiapp.com/yunying/zhuanti.php?&app_id=246706046&app_oid=315bfdfecebdc556f2a4a1c64fde9a8781f576f1&app_version=2.0.1&app_channel=appstore&sche=jkjby
//    NSDictionary *dic = @{@"app_id":@"246706046", @"app_oid":@"315bfdfecebdc556f2a4a1c64fde9a8781f576f1", @"app_version":@"2.0.1", @"app_channel":@"appstore", @"sche":@"jkjby"};

    [YZAccessNet getDataFromURLString:ScrollImageURLString parameters:nil complationBlock:^(NSData *data) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dictionary objectForKey:@"data"];
        NSMutableArray *dataArr = [[NSMutableArray alloc]initWithCapacity:array.count];
        for (NSDictionary *dic in array) {
            YZScrollImageData *data = [YZScrollImageData parserDataFromDictionary:dic];
            [dataArr addObject:data];
        }
        complationBlock(dataArr);
    } failure:^(NSError *error) {
//        NSLog(@"getScrollDataError:%@", error);
        failureBlock(error);
    }];
}
+ (void)getListDataWithListNumber:(NSInteger)listNumber ComplationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock{
    NSString *category = @"list_api";
    [YZAccessNet getDataFromURLString:ListURLString(category, listNumber) parameters:nil complationBlock:^(NSData *data) {
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSArray *array = [dictionary objectForKey:@"list"];
        NSMutableArray *dataArr = [[NSMutableArray alloc]initWithCapacity:array.count];
        for (NSDictionary *dic in array) {
            YZListData *data = [YZListData parserDataFromDictionary:dic];
            [dataArr addObject:data];
        }
        complationBlock(dataArr);
    } failure:^(NSError *error) {
//        NSLog(@"getListDataError:%@", error);
        failureBlock(error);
    }];
}

@end
