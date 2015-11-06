//
//  YZAccessNet.m
//  YZFreeShop
//
//  Created by lunarboat on 15/10/30.
//  Copyright © 2015年 lunarboat. All rights reserved.
//

#import "YZAccessNet.h"

@implementation YZAccessNet

+ (void)getDataFromURLString:(NSString *)urlStr parameters:(NSDictionary *)parameters complationBlock:(void (^) (NSData *data))block failure:(void (^) (NSError *error))failError{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            failError(error);
        }else{
            block(data);
        }   
    }];
    [dataTask resume];
}

@end
