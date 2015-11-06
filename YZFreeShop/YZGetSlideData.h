//
//  YZGetSlideData.h
//  YZFreeShop
//
//  Created by lunarboat on 15/11/6.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZGetSlideData : NSObject

+ (void)getEveryDayDataWithComplationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock;
+ (void)getTomorrowDataWithComplationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock;
@end
