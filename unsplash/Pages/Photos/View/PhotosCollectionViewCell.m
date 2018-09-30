//
//  PhotosCollectionViewCell.m
//  unsplash
//
//  Created by HF on 2018/9/30.
//  Copyright © 2018 HEMU. All rights reserved.
//

#import "PhotosCollectionViewCell.h"
#import "PhotosView.h"

@interface PhotosCollectionViewCell ()
@property (nonatomic, strong) PhotosView *photoView;
@end

@implementation PhotosCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp
{
    [self addSubview:self.photoView];
    [self.photoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(@(0));
        make.top.equalTo(@(0));
        make.bottom.lessThanOrEqualTo(@(0));
    }];
}

- (PhotosView *)photoView
{
    if (!_photoView) {
        _photoView = [PhotosView new];
    }
    return _photoView;
}

@end
