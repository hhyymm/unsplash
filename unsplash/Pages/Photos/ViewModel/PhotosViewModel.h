//
//  PhotosViewModel.h
//  unsplash
//
//  Created by HF on 2018/9/30.
//  Copyright © 2018 HEMU. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveObjC/ReactiveObjC.h>
#import "HHPublicPhotosModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PhotosViewModel : NSObject

@property (nonatomic, strong) RACCommand *loadMore;

@property (nonatomic, strong) RACCommand *loadNew;

@property (nonatomic, strong, readonly) NSError* error;

@property (nonatomic, copy  ) NSArray *photosArr;



@end

NS_ASSUME_NONNULL_END
