//
//  HHPublicPhotosModel.m
//  unsplash
//
//  Created by HF on 2018/9/30.
//  Copyright © 2018 HEMU. All rights reserved.
//

#import "HHPublicPhotosModel.h"

@implementation HHPublicPhotosModel

+ (void)initialize
{
    [HHPublicPhotosModel mj_setupObjectClassInArray:^NSDictionary *{
        return @{
                 @"categories" : [HHPublicPhotosCategories class],
                 @"current_user_collections" : [Current_user_collections class]
                 };
    }];
    

    [HHPublicPhotosModel mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID" : @"id",
                 @"Description" : @"description"
                 };
    }];

    [HHPublicPhotosLinks mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"kself" : @"self"
                 };
    }];

    [HHPublicPhotosUserLinks mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"kself" : @"self"
                 };
    }];

    [HHPublicPhotosUserLinks mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        return @{@"ID" : @"id",
                 };
    }];
}

@end

@implementation HHPublicPhotosUrls

@end

@implementation HHPublicPhotosCategories

@end

@implementation HHPublicPhotosUser

@end

@implementation HHPublicPhotosUserLinks

@end

@implementation HHPublicPhotosLinks

@end

@implementation Current_user_collections

@end
