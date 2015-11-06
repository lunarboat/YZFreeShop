//
//  YZScrollImageData.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZScrollImageData.h"

@implementation YZScrollImageData

+ (YZScrollImageData *)parserDataFromDictionary:(NSDictionary *)dic{
    YZScrollImageData *scrollImageData = [[YZScrollImageData alloc]init];
    scrollImageData.iphoneimg = [dic objectForKey:@"iphoneimg"];
    scrollImageData.iphonemimg = [dic objectForKey:@"iphonemimg"];
    scrollImageData.iphonezimg = [dic objectForKey:@"iphonezimg"];
    scrollImageData.iphoneimgnew = [dic objectForKey:@"iphoneimgnew"];
    scrollImageData.title = [dic objectForKey:@"title"];
    scrollImageData.link = [dic objectForKey:@"link"];
    scrollImageData.target = [dic objectForKey:@"target"];
    return scrollImageData;
}

@end
