//
//  FJExcellentStudentController.m
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJService.h"
#import "UIView+Extension.h"
#import "FJExcellentStudentController.h"
#import "FJExcellentStudentCompanyJobCell.h"
@interface FJExcellentStudentController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) NSMutableArray *companyJobList;
@property (nonatomic,strong) UICollectionView *collectionView;
@end

@implementation FJExcellentStudentController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self initConstraints];
    [self fetchExcellentStudentJobList];
    self.navigationItem.title = @"优秀生直通车";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark
-(void)setUpSubviews{
    [self.view addSubview:self.collectionView];
}

-(void)initConstraints{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
#pragma mark
-(void)fetchExcellentStudentJobList{
    [self.view at_postLoading];
    [[FJService instance].homeService fetchExcellentStudentListAtSize:100 successBlock:^(NSArray* companyJobList) {
        if (companyJobList.count) {
            [self.companyJobList addObjectsFromArray:companyJobList];
        }
        [self.collectionView reloadData];
        [self.view at_hideLoading];
    } failureBlock:^(NSString *msg) {
        [self.view at_postMessage:msg];
    }];
}

#pragma mark
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.companyJobList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FJExcellentStudentCompanyJobCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[FJExcellentStudentCompanyJobCell cellId] forIndexPath:indexPath];
    cell.companyJob = self.companyJobList[indexPath.row];
    return cell;
}

#pragma mark
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat itemW = (int)((collectionView.frame.size.width-54)/2.0);
    CGFloat itemH = itemW*(183/162.0);
    return CGSizeMake(itemW, itemH);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(18,18,18,18);
}

#pragma mark
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    
}

#pragma mark
-(NSMutableArray*)companyJobList{
    if (!_companyJobList) {
        _companyJobList = [NSMutableArray array];
    }
    return _companyJobList;
}


-(UICollectionView*)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 20;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[FJExcellentStudentCompanyJobCell class] forCellWithReuseIdentifier:[FJExcellentStudentCompanyJobCell cellId]];
    }
    return _collectionView;
}
@end
