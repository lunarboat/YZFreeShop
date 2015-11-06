//
//  YZHomeData.h
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZHomeData : NSObject
/**
 *  拿滚动视图中的数据
 *
 *  @param complationBlock 获取数据完成后的操作
 */
+ (void)getScrollDatawithComplationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock;
/**
 *   获取商品列表中的数据
 *
 *  @param listNumber      商品类别编号
 *  @param complationBlock 完成后的操作
 */
+ (void)getListDataWithListNumber:(NSInteger)listNumber ComplationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock;
@end
