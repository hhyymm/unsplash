//
//  HHPublicPhotosModel.h
//  unsplash
//
//  Created by HF on 2018/9/30.
//  Copyright © 2018 HEMU. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class HHPublicPhotosCategories,HHPublicPhotosUrls,HHPublicPhotosUser,HHPublicPhotosLinks,HHPublicPhotosUserLinks,Current_user_collections;
@interface HHPublicPhotosModel : NSObject

@property (nonatomic , copy) NSString              * ID;
@property (nonatomic , copy) NSString              * Description;
@property (nonatomic , copy) NSArray< HHPublicPhotosCategories *>              * categories;
@property (nonatomic , assign) BOOL              sponsored;
@property (nonatomic , copy) NSString              * created_at;
@property (nonatomic , assign) NSInteger              width;
@property (nonatomic , assign) NSInteger              likes;
@property (nonatomic , copy) NSString              * color;
@property (nonatomic , strong) HHPublicPhotosUrls              * urls;
@property (nonatomic , copy) NSArray<Current_user_collections *>              * current_user_collections;
@property (nonatomic , copy) NSString              * updated_at;
@property (nonatomic , assign) NSInteger              height;
@property (nonatomic , strong) HHPublicPhotosLinks              * links;
@property (nonatomic , assign) BOOL              liked_by_user;
@property (nonatomic , copy) NSString              * slug;
@property (nonatomic , strong) HHPublicPhotosUser              * user;

@end

@interface HHPublicPhotosCategories :NSObject

@end

@interface HHPublicPhotosUrls :NSObject
@property (nonatomic , copy) NSString              * raw;
@property (nonatomic , copy) NSString              * full;
@property (nonatomic , copy) NSString              * thumb;
@property (nonatomic , copy) NSString              * regular;
@property (nonatomic , copy) NSString              * small;

@end

@interface Current_user_collections :NSObject

@end

@interface HHPublicPhotosLinks :NSObject
@property (nonatomic , copy) NSString              * download_location;
@property (nonatomic , copy) NSString              * kself;
@property (nonatomic , copy) NSString              * html;
@property (nonatomic , copy) NSString              * download;

@end

@interface HHPublicPhotosUserLinks :NSObject
@property (nonatomic , copy) NSString              * photos;
@property (nonatomic , copy) NSString              * following;
@property (nonatomic , copy) NSString              * portfolio;
@property (nonatomic , copy) NSString              * html;
@property (nonatomic , copy) NSString              * followers;
@property (nonatomic , copy) NSString              * kself;
@property (nonatomic , copy) NSString              * likes;

@end

@interface HHPublicPhotosProfile_image :NSObject
@property (nonatomic , copy) NSString              * small;
@property (nonatomic , copy) NSString              * large;
@property (nonatomic , copy) NSString              * medium;

@end

@interface HHPublicPhotosUser :NSObject
@property (nonatomic , copy) NSString              * id;
@property (nonatomic , assign) NSInteger              total_photos;
@property (nonatomic , copy) NSString              * twitter_username;
@property (nonatomic , copy) NSString              * instagram_username;
@property (nonatomic , copy) NSString              * portfolio_url;
@property (nonatomic , copy) NSString              * bio;
@property (nonatomic , copy) NSString              * location;
@property (nonatomic , copy) NSString              * first_name;
@property (nonatomic , copy) NSString              * updated_at;
@property (nonatomic , copy) NSString              * username;
@property (nonatomic , strong) HHPublicPhotosUserLinks              * links;
@property (nonatomic , strong) HHPublicPhotosProfile_image              * profile_image;
@property (nonatomic , copy) NSString              * last_name;
@property (nonatomic , assign) NSInteger              total_collections;
@property (nonatomic , copy) NSString              * name;
@property (nonatomic , assign) NSInteger              total_likes;

@end

NS_ASSUME_NONNULL_END
