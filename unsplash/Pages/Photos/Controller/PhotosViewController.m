//
//  PhotosViewController.m
//  unsplash
//
//  Created by HF on 2018/9/30.
//  Copyright © 2018 HEMU. All rights reserved.
//

#import "PhotosViewController.h"
#import "PhotosViewModel.h"
#import "UIScreen+YYAdd.h"
#import "PhotosCollectionViewCell.h"

static NSString * PhotosCellIdentifer = @"PhotosCellIdentifer";
@interface PhotosViewController () <UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) PhotosViewModel  *viewModel;
@property (nonatomic, strong) NSMutableDictionary *sizeDict;
@end

@implementation PhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Photos";
    [self setUI];
    [self bindViewModel];
}

- (void)setUI
{
    [self.view addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(@(0));
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
            make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        } else {
            make.top.equalTo(self.mas_topLayoutGuideBottom);
            make.bottom.equalTo(self.mas_bottomLayoutGuideTop);
        }
    }];
}

- (void)bindViewModel
{
    [RACObserve(self.viewModel, photosArr) subscribeNext:^(id  _Nullable x) {
        [self.collectionView reloadData];
    }];
}

#pragma mark -
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.viewModel.photosArr.count;
}

-  (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotosCellIdentifer forIndexPath:indexPath];
    return cell;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.sizeDict objectForKey:indexPath]) {
        return [[self.sizeDict objectForKey:indexPath] CGSizeValue];
    }

    CGSize size = [[UIScreen mainScreen] currentBounds].size;
    CGFloat width = ceil(size.width - 10*2 - 8)/2.0;
    CGFloat height = ceil(size.width - 10*2 - 8)/2.0;

    return CGSizeMake(0, 0);
}


#pragma mark -

- (UICollectionView *)collectionView
{
    if (!_collectionView)
    {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.minimumLineSpacing = 8;
        flowLayout.minimumInteritemSpacing = 8;
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);

        _collectionView = [[UICollectionView alloc] initWithFrame: CGRectZero collectionViewLayout: flowLayout];
        _collectionView.translatesAutoresizingMaskIntoConstraints = NO;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;

        [_collectionView registerClass:[PhotosCollectionViewCell class] forCellWithReuseIdentifier:PhotosCellIdentifer];

        @weakify(self);
        _collectionView.mj_header = [MJRefreshStateHeader headerWithRefreshingBlock:^{

            @strongify(self);
            [[[self.viewModel loadNew] execute:nil] subscribeNext:^(id  _Nullable x) {
                [self->_collectionView.mj_header endRefreshing];
            } error:^(NSError * _Nullable error) {
                [self->_collectionView.mj_header endRefreshing];
            }];
        }];

        _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{

            @strongify(self);
            [[[self.viewModel loadMore] execute:nil] subscribeNext:^(id  _Nullable x) {
                [self->_collectionView.mj_footer endRefreshing];
            } error:^(NSError * _Nullable error) {
                [self->_collectionView.mj_footer endRefreshing];
            }];

        }];

        _collectionView.mj_footer.hidden = YES;
    }

    return _collectionView;
}

- (NSMutableDictionary *)sizeDict
{
    if (!_sizeDict) {
        _sizeDict = [NSMutableDictionary dictionary];
    }
    return _sizeDict;
}

@end
