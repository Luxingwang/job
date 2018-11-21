//
//  ManageCollectionTagsView.m
//  Shuangdaojia_Merchant
//
//  Created by XXX on 2017/7/19.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import "ManageCollectionTagsView.h"
#import "ManageEditTagsViewController.h"
#import "ManageCollectionTagCell.h"
#import "TagsModel.h"
#import "FJIndustry.h"
#import "NSString+Size.h"

@interface ManageCollectionTagsView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@end

@implementation ManageCollectionTagsView

- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout
{
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self) {
        // 基本信息
        self.backgroundColor = [UIColor whiteColor];
        self.delegate = self;
        self.dataSource = self;
        
        [self registerClass:[ManageCollectionTagCell class] forCellWithReuseIdentifier:NSStringFromClass([ManageCollectionTagCell class])];
    }
    return self;
}

#pragma mark - UICollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
        return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
       return self.dataArray.count;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    // 技师没有header
    return CGSizeMake(SCREEN_WIDTH, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    CGFloat height = 0;
    return CGSizeMake(SCREEN_WIDTH, height);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerView = (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:NSStringFromClass([UICollectionReusableView class]) forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor redColor];
        return footerView;
    }
    UICollectionReusableView *headerView = (UICollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:NSStringFromClass([UICollectionReusableView class]) forIndexPath:indexPath];
//    TitleSectionView *view = [[TitleSectionView alloc]initWithTitle:@[!self.vcType ? @"诊断信息" : @"已添加标签", @"快速选择热门标签"][indexPath.section]];
//    [view addSeparatorWithType:SeparatorTypeBottomFill];
//    view.frame = CGRectMake(0, 0, SCREEN_WIDTH, [TitleSectionView viewHeight]);
//    [headerView addSubview:view];
    return headerView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FJIndustry *data = self.dataArray[indexPath.item];
    
    CGFloat width = [data.name getWidthWithFont:[UIFont systemFontOfSize:16] height:15];
    return CGSizeMake(width + 20, 38);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(15, 10, 15, 10);
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FJIndustry *industry = self.dataArray[indexPath.row];
    ManageCollectionTagCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([ManageCollectionTagCell class]) forIndexPath:indexPath];
    cell.text = industry.name;
    cell.isSelected = industry.isSelected;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.didSelectItemAtIndexPath) {
        self.didSelectItemAtIndexPath(indexPath);
    }
}
@end
