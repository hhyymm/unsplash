//
//  HHUnsplashProtocol.h
//  unsplash
//
//  Created by HF on 2018/9/29.
//  Copyright © 2018 HEMU. All rights reserved.
//

#ifndef HHUnsplashProtocol_h
#define HHUnsplashProtocol_h
#import "HHNetworkGlobal.h"

@protocol HHUnsplashProtocol <NSObject>

- (void)fetchPublicImageThenCallBack:(HHResultBlock)callBack;

@end

#endif /* HHUnsplashProtocol_h */
