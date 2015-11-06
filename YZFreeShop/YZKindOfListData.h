//
//  YZKindOfListData.h
//  YZFreeShop
//
//  Created by lunarboat on 15/11/5.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZKindOfListData : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *cid;

+ (YZKindOfListData *)parserDataFromDictionary:(NSDictionary *)dic;

@end
