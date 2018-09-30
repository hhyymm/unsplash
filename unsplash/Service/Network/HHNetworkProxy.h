//
//  HHNetworkProxy.h
//  unsplash
//
//  Created by HF on 2018/9/29.
//  Copyright © 2018 HEMU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HHUnsplashProtocol.h"
#import "HHUnspashNetworkManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface HHNetworkProxy : NSProxy <HHUnsplashProtocol>
/**
 网络模块

 @return 网络模块单例
 */
+ (instancetype)sharedInstance;


/**
 注册网络模块

 @param httpProtocol 网络模块协议
 @param handler 满足该协议的对象
 */
- (void)registerHttpProtocol:(Protocol *)httpProtocol handler:(id)handler;

@end

NS_ASSUME_NONNULL_END
