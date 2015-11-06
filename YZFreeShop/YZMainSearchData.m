//
//  YZMainSearchData.m
//  YZFreeShop
//
//  Created by lunarboat on 15/11/3.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZMainSearchData.h"
#import "YZAccessNet.h"
#import "YZKindOfListData.h"
#import "YZListData.h"

#define MainSearchDataURl @"http://app.api.repaiapp.com/sx/yangshijie/jiekou/zhuFengNewSummary/zhuFengNewSummaryJson.php?cat=7&app_id=246706046&app_oid=315bfdfecebdc556f2a4a1c64fde9a8781f576f1&app_version=2.0.1&app_channel=appstore&sche=jkjby"
#define KindListDataURL @"http://zhekou.repaiapp.com/jkjby/view/tmzk_menu_api.php?app_id=246706046&app_oid=b883a62174cd79613d40d7ba300cb9a65d1223c6&app_version=2.0.1&app_channel=appstore&sche=jkjby"
#define SearchItemDataURL(searchName) [NSString stringWithFormat:@"http://m.repai.com/search/search_items_api/query/%@/offset/0/limit/50/appkey/100012/app_id/246706046",searchName]

@interface YZMainSearchData ()

@end

@implementation YZMainSearchData

+ (NSArray *)typeArray{
    return @[@"美容院", @"母婴坊", @"电器城", @"零食店", @"居家屋", @"男人装", @"女人街"];
}

+ (void)getMainSearchDataComplationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock{
    [YZAccessNet getDataFromURLString:MainSearchDataURl parameters:nil complationBlock:^(NSData *data) {
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        NSArray *array = [dictionary objectForKey:@"list"];
        NSMutableArray *dataArr = [[NSMutableArray alloc]initWithCapacity:array.count];
        for (NSDictionary *dic in array) {
            YZSearchData *data = [YZSearchData parserDataFromDictionary:dic];
            [dataArr addObject:data];
        }
        complationBlock(dataArr);
        
    } failure:^(NSError *error) {
        failureBlock(error);
    }];
}

+ (void)getKindListDataWithKind:(NSInteger)kindIndex ComplationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock{
    [YZAccessNet getDataFromURLString:KindListDataURL parameters:nil complationBlock:^(NSData *data) {
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        NSArray *array = [dictionary objectForKey:[[self typeArray] objectAtIndex:kindIndex]];
        NSMutableArray *dataArr = [[NSMutableArray alloc]initWithCapacity:array.count];
        for (NSDictionary *dic in array) {
            YZKindOfListData *kindOfListData = [YZKindOfListData parserDataFromDictionary:dic];
            [dataArr addObject:kindOfListData];
        }
        complationBlock(dataArr);
    } failure:^(NSError *error) {
        failureBlock(error);
    }];
}

+ (void)getSearchItemListWithSearchItem:(NSString *)searchItem complationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock{
    NSString *newString = [searchItem stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLHostAllowedCharacterSet]];
    [YZAccessNet getDataFromURLString:SearchItemDataURL(newString) parameters:nil complationBlock:^(NSData *data) {
        NSError *jsonError = nil;
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
        NSArray *array = [dictionary objectForKey:@"data"];
        NSMutableArray *dataArr = [[NSMutableArray alloc]initWithCapacity:array.count];
        for (NSDictionary *dic in array) {
            YZListData *data = [YZListData parserDataTwoFromDictionary:dic];
            [dataArr addObject:data];
        }
        complationBlock(dataArr);
        
    }failure:^(NSError *error) {
        failureBlock(error);
    }];
}



@end
