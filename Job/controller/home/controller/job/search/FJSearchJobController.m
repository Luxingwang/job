//
//  FJSearchJobController.m
//  Job
//
//  Created by 小黑胖 on 2018/12/7.
//  Copyright © 2018 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJService.h"
#import "FJSearchBar.h"
#import "FJJobSearchItem.h"
#import "FJSearchJobController.h"
#import "FJSearchJobKeywordItemCell.h"
#import "ManageCollectionTagsFlowLayout.h"
#import "FJSearchJobKeywordCategoryHeader.h"

@interface FJSearchJobController ()<UISearchBarDelegate,UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) FJSearchBar *searchBar;
@property (nonatomic,strong) NSArray *searchCatogerys;
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation FJSearchJobController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self initConstraints];
    [self fetchSearchItemList];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)setUpSubviews
{
    [self.view addSubview:self.collectionView];
    self.navigationItem.titleView = self.searchBar;
}

-(void)initConstraints
{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

-(void)fetchSearchItemList
{
    [[FJService instance].jobListService fetchSearchKeyItemListSuccessBlock:^(NSArray *searchCatogerys) {
        self.searchCatogerys = searchCatogerys;
        [self.collectionView reloadData];
    } failureBlock:^(NSString *msg) {
        
    }];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.searchCatogerys.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    FJJobSearchCategory *catogery = self.searchCatogerys[section];
    return catogery.searchItems.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    FJSearchJobKeywordItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[FJSearchJobKeywordItemCell cellId] forIndexPath:indexPath];
    FJJobSearchCategory *catogery = self.searchCatogerys[indexPath.section];
    cell.searchItem = catogery.searchItems[indexPath.row];
    return cell;
}

#pragma mark
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FJJobSearchCategory *catogery = self.searchCatogerys[indexPath.section];
    FJJobSearchItem *searchItem = catogery.searchItems[indexPath.row];
    searchItem.needDisplayAtHeight = @(31);
    return CGSizeMake(searchItem.descriptionWidth.floatValue+26,31);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0,18,0,18);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(collectionView.frame.size.width,40);
}

-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    FJSearchJobKeywordCategoryHeader *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:[FJSearchJobKeywordCategoryHeader headerId] forIndexPath:indexPath];
    header.keywordCategory = self.searchCatogerys[indexPath.section];
    return header;
}

#pragma mark getter methods
-(FJSearchBar*)searchBar
{
    if (!_searchBar) {
        _searchBar = [[FJSearchBar alloc] initWithFrame:CGRectMake(0,0,200,44)];
        _searchBar.delegate = self;
        _searchBar.placeholder = @"岗位/薪资";
        _searchBar.backgroundImage = [[UIImage alloc] init];
        _searchBar.textFiledInset = UIEdgeInsetsMake(5,10,5,10);
        _searchBar.textFiledBackgroundColor = [UIColor at_colorWithHex:0xF2F2F2];
    }
    return _searchBar;
}

-(UICollectionView*)collectionView{
    if (!_collectionView) {
        ManageCollectionTagsFlowLayout *layout = [[ManageCollectionTagsFlowLayout alloc] init];
        layout.betweenOfCell = 9;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        [_collectionView registerClass:[FJSearchJobKeywordItemCell class] forCellWithReuseIdentifier:[FJSearchJobKeywordItemCell cellId]];
        [_collectionView registerClass:[FJSearchJobKeywordCategoryHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:[FJSearchJobKeywordCategoryHeader headerId]];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        _collectionView.contentInset = UIEdgeInsetsMake(18,0,18,0);
    }
    return _collectionView;
}
@end
