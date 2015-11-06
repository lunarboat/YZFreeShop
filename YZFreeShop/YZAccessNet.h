//
//  YZAccessNet.h
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZAccessNet : NSObject

+ (void)getDataFromURLString:(NSString *)urlStr parameters:(NSDictionary *)parameters complationBlock:(void (^) (NSData *data))block failure:(void (^) (NSError *error))failError;

@end
