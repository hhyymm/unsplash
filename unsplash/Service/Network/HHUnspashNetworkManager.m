//
//  HHUnspashNetworkManager.m
//  unsplash
//
//  Created by HF on 2018/9/29.
//  Copyright © 2018 HEMU. All rights reserved.
//

#import "HHUnspashNetworkManager.h"
#import <AFNetworking/AFNetworking.h>
#import "HHRequestParametersHelp.h"

@implementation HHUnspashNetworkManager

#pragma mark -
- (void)requestWithMethod:(NSString*)method
                URLString:(NSString *)URLString
               parameters:(NSDictionary *)parameters
                 progress:(nullable void (^)(NSProgress *progress))progressBlock
                  success:(nullable void (^)(NSURLSessionDataTask *task, id _Nullable responseObject))success
                  failure:(nullable void (^)(NSURLSessionDataTask * _Nullable task, NSError *error))failure
{
    NSDictionary* requestParameters = [HHRequestParametersHelp parameters: parameters];

    if ([[method uppercaseString] isEqualToString: @"POST"])
    {
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];

        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
        [requestSerializer setValue: @"application/json" forHTTPHeaderField: @"Content-Type"];
            //[[NSUserDefaults standardUserDefaults] valueForKey:@"userToken"]
        [requestSerializer setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"userToken"] forHTTPHeaderField:@"Authorization"];
        NSLog(@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"userToken"]);

        manager.requestSerializer = requestSerializer;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/plain", nil];
        manager.requestSerializer.timeoutInterval = 10;

        [manager POST: URLString parameters: requestParameters progress:^(NSProgress * _Nonnull uploadProgress) {
            if (progressBlock){
                progressBlock(uploadProgress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success){
                success(task, responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure){
                failure(task, error);
            }
        }];
    }
    else if ([[method uppercaseString] isEqualToString: @"GET"])
    {
        AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];

        AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
            //[[NSUserDefaults standardUserDefaults] valueForKey:@"userToken"]
        [requestSerializer setValue:[[NSUserDefaults standardUserDefaults] valueForKey:@"userToken"] forHTTPHeaderField:@"Authorization"];
        NSLog(@"%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"userToken"]);

        manager.requestSerializer = requestSerializer;
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/html",@"text/plain", nil];

        manager.requestSerializer.timeoutInterval = 10;

        [manager GET: URLString parameters: requestParameters progress:^(NSProgress * _Nonnull progress) {
            if (progressBlock){
                progressBlock(progress);
            }
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            if (success){
                success(task, responseObject);
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            if (failure){
                failure(task, error);
            }
        }];
    }
    else
    {
        NSLog(@"暂时没有这类接口");
    }
}

- (void)fetchPublicImageThenCallBack:(HHResultBlock)callBack
{
    
}


@end
