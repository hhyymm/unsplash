//
//  PhotosViewModel.m
//  unsplash
//
//  Created by HF on 2018/9/30.
//  Copyright © 2018 HEMU. All rights reserved.
//

#import "PhotosViewModel.h"
#import "HHNetworkProxy.h"

@interface PhotosViewModel ()
@property (nonatomic, assign) NSInteger pageIndex;
@property (nonatomic, assign) NSInteger totolPages;
@property (nonatomic, strong) RACSubject* errors;
@property (nonatomic, strong) NSError* error;

@end

@implementation PhotosViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        @weakify(self);
        self.loadNew = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [self loadDataSignal];
        }];

        self.loadMore = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            @strongify(self);
            return [self loadDataSignal];
        }];
    }
    return self;
}


- (RACSignal *)loadDataSignal
{
    return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [[HHNetworkProxy sharedInstance] fetchPublicImageThenCallBack:^(id  _Nullable object, NSError * _Nullable error) {
            if (error) {
                [subscriber sendError:error];
            } else {
                NSArray<HHPublicPhotosModel *> *modelArr = object;
                self.photosArr = modelArr;
                [subscriber sendNext:modelArr];
                [subscriber sendCompleted];
            }
        }];
        return nil;
    }];
}
@end
