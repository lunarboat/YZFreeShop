//
//  YZShoppingData.h
//  YZFreeShop
//
//  Created by lunarboat on 15/11/2.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BigListDataCategory) {
    BigListDataCategoryBoutique = 0,
    BigListDataCategoryRecommend = 10,
};
@interface YZShoppingData : NSObject

+ (void)getBigListDataWithCategory:(BigListDataCategory)category ComplationBlock:(void (^)(NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock;

@end
