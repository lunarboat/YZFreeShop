//
//  YZScrollImageData.h
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YZScrollImageData : NSObject

@property (nonatomic, copy) NSString *iphoneimg;
@property (nonatomic, copy) NSString *iphonezimg;
@property (nonatomic, copy) NSString *iphonemimg;
@property (nonatomic, copy) NSString *iphoneimgnew;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *target;
@property (nonatomic, copy) NSString *link;

+ (YZScrollImageData *)parserDataFromDictionary:(NSDictionary *)dic;

@end
