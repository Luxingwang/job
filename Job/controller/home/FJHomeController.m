//
//  FJHomeController.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJService.h"
#import "MJRefresh.h"
#import "FJHomeController.h"
#import "UIView+Extension.h"
@interface FJHomeController ()
@property (nonatomic,assign) NSInteger page;
@end

@implementation FJHomeController
@synthesize entranceItems    = _entranceItems;
@synthesize recommendJobList = _recommendJobList;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpMJRefresh];
    [self fetchDynamicsList];
    [self mjPull];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark
-(void)setUpMJRefresh{
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(mjPull)];
}

#pragma mark
-(void)mjPull
{
    ++self.page;
    [self fetchRecommendJobList];
}

-(void)fetchDynamicsList
{
    [[FJService instance].homeService fetchDynamicsListSuccessBlock:^(id data) {
        
    } failureBlock:^(NSString *msg) {
        
    }];
}

-(void)fetchRecommendJobList
{
    [[FJService instance].homeService fetchRecommendJobListAtPage:self.page successBlock:^(NSArray *recommendJobList, BOOL allFetch) {
        if (allFetch == YES){
            [self.collectionView.mj_footer endRefreshingWithNoMoreData];
        }else{
            [self.collectionView.mj_footer endRefreshing];
            [self.recommendJobList addObjectsFromArray:recommendJobList];
        }
        [self.collectionView reloadData];
    } failureBlock:^(NSString *msg) {
        [self.view at_postMessage:msg];
    }];
}
#pragma mark
-(NSArray*)entranceItems
{
    return [FJService instance].homeService.entranceItems;
}

-(NSMutableArray*)recommendJobList{
    if (!_recommendJobList) {
        _recommendJobList = [NSMutableArray array];
    }
    return _recommendJobList;
}
@end
