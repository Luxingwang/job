//
//  FJBaseHomeController.m
//  Job
//
//  Created by 小黑胖 on 2018/10/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJFlowLayout.h"
#import "FJHomeBannerCell.h"
#import "FJHomeDynamicsCell.h"
#import "FJBaseHomeController.h"
#import "FJHomeEntranceItemCell.h"
#import "FJHomeRecommendJobCell.h"
#import "FJJobChanceController.h"
#import "FJExcellentStudentController.h"
#import "FJInfomationListController.h"
#import "FJInfomationDetailController.h"
#import "FJUserSendEmailTypeController.h"
@interface FJBaseHomeController ()<UICollectionViewDelegate,UICollectionViewDataSource,FJHomeDynamicsCellDelegate>
@property (nonatomic,strong) UISearchBar *searchBar;
@end

@implementation FJBaseHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self initConstraints];
    [self setUpRightItem];
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

-(void)setUpRightItem
{
    UIImage *img = [UIImage imageNamed:@"img_home_send_email"];
    UIButton *rigthItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rigthItemBtn.bounds = CGRectMake(0,0,img.size.width,img.size.height);
    [rigthItemBtn setImage:img forState:UIControlStateNormal];
    [rigthItemBtn addTarget:self action:@selector(sendEmailItemClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rigthItemBtn];
}

-(void)sendEmailItemClicked:(UIButton*)sender
{
    FJUserSendEmailTypeController *controller = [[FJUserSendEmailTypeController alloc] init];
    controller.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark FJHomeDynamicsCellDelegate
-(void)collectionViewCell:(FJHomeDynamicsItemCell *)cell didSelectInfomationLite:(FJInfomationLite *)infomationLite
{
    FJInfomationDetailController *controller = [[FJInfomationDetailController alloc] init];
    controller.infoId = infomationLite.infoId;
    controller.infoTitle = infomationLite.title;
    [self.navigationController pushViewController:controller animated:YES];
}
#pragma mark
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        return 1;
    }
    if (section==1) {
        return self.entranceItems.count;
    }
    if (section==2) {
        return 1;
    }
    return self.recommendJobList.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    if (section==0)
    {
        FJHomeBannerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[FJHomeBannerCell cellId] forIndexPath:indexPath];
        return cell;
    }
    else if (section==1)
    {
        FJHomeEntranceItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[FJHomeEntranceItemCell cellId] forIndexPath:indexPath];
        cell.entranceItem = self.entranceItems[indexPath.row];
        return cell;
    }
    else if (section==2)
    {
        FJHomeDynamicsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[FJHomeDynamicsCell cellId] forIndexPath:indexPath];
        cell.delegate = self;
        cell.dynamicsList = self.dynamicsList;
        return cell;
    }
    FJHomeRecommendJobCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[FJHomeRecommendJobCell cellId] forIndexPath:indexPath];
    cell.job = self.recommendJobList[indexPath.row];
    return cell;
}

#pragma mark
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat itemW = 0;
    CGFloat itemH = 0;
    NSInteger section = indexPath.section;
    if (section==0) {
        itemW = collectionView.frame.size.width;
        itemH = 119;
    }
    else if (section==1) {
        itemW = (int)((collectionView.frame.size.width-24-23*3)/4.0);
        itemH = 74;
    }else if (section==2)
    {
        itemW = collectionView.frame.size.width;
        itemH = 81;
    }else
    {
        itemW = (int)((collectionView.frame.size.width-36-13)/2.0);
        itemH = itemW*(102/163.0)+71;
    }
    return CGSizeMake(itemW, itemH);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section==0||section==2) {
        return UIEdgeInsetsZero;
    }
    if (section==1) {
        return UIEdgeInsetsMake(16,12,0,12);
    }
    return UIEdgeInsetsMake(0,18,0,18);
}

#pragma mark
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger section = indexPath.section;
    if (section==0)
    {
        
    }else if (section==1)
    {
        NSInteger row = indexPath.row;
        if (row==0)
        {
            FJInfomationListController *controller = [[FJInfomationListController alloc] init];
            controller.listType = InfomationListTypeStory;
            [self.navigationController pushViewController:controller animated:YES];
        }
        else if (row==1)
        {
            FJJobChanceController *controller = [[FJJobChanceController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
        else if (row==2)
        {
            FJInfomationListController *controller = [[FJInfomationListController alloc] init];
            controller.listType = InfomationListTypeNews;
            [self.navigationController pushViewController:controller animated:YES];
        }
        else
        {
            FJExcellentStudentController *controller = [[FJExcellentStudentController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
    }else if (section==2)
    {
        
    }else
    {
        
    }
}
#pragma mark
-(UICollectionView*)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 14;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[FJHomeBannerCell class] forCellWithReuseIdentifier:[FJHomeBannerCell cellId]];
        [_collectionView registerClass:[FJHomeDynamicsCell class] forCellWithReuseIdentifier:[FJHomeDynamicsCell cellId]];
        [_collectionView registerClass:[FJHomeEntranceItemCell class] forCellWithReuseIdentifier:[FJHomeEntranceItemCell cellId]];
        [_collectionView registerClass:[FJHomeRecommendJobCell class] forCellWithReuseIdentifier:[FJHomeRecommendJobCell cellId]];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

@end
