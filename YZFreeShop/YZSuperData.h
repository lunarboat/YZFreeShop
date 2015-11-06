//
//  YZSuperData.h
//  YZFreeShop
//
//  Created by lunarboat on 15/11/1.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZSuperData : NSObject

+ (void)getListDataWithListNumber:(NSInteger)listNumber ComplationBlock:(void (^) (NSArray *array))complationBlock failure:(void (^) (NSError *error))failureBlock;

@end
