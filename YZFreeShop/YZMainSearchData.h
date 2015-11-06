//
//  YZMainSearchData.h
//  YZFreeShop
//
//  Created by lunarboat on 15/11/3.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "YZSearchData.h"

@interface YZMainSearchData : NSObject

+ (void)getMainSearchDataComplationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock;

+ (void)getKindListDataWithKind:(NSInteger)kindIndex ComplationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock;

+ (void)getSearchItemListWithSearchItem:(NSString *)searchItem complationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock;

@end
