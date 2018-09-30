//
//  PhotosView.m
//  unsplash
//
//  Created by HF on 2018/9/30.
//  Copyright © 2018 HEMU. All rights reserved.
//

#import "PhotosView.h"

@implementation PhotosView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    [self addSubview:self.imageV];
    [self.imageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}


#pragma mark - setter/getter
- (UIImageView *)imageV
{
    if (!_imageV) {
        _imageV = [UIImageView new];
        _imageV.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imageV;
}

@end
