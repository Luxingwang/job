//
//  FJInfomationListController.m
//  Job
//
//  Created by 小黑胖 on 2018/10/9.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <Masonry.h>
#import "FJService.h"
#import "MJRefresh.h"
#import "UIView+Extension.h"
#import "FJInfomationListCell.h"
#import "FJInfomationListController.h"
#import "FJInfomationDetailController.h"
@interface FJInfomationListController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,assign) NSInteger page;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *infoLiteList;
@end

@implementation FJInfomationListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self initConstraints];
    [self setUpMjRefresh];
    self.navigationItem.title = self.listType==InfomationListTypeStory?@"滨江故事":@"企业动态";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark
-(void)setUpSubviews{
    [self.view addSubview:self.tableView];
}
-(void)initConstraints{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

-(void)setUpMjRefresh
{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(mjDrop)];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(mjPull)];
    [self.tableView.mj_header beginRefreshing];
}

-(void)mjDrop
{
    self.page = 1;
    [self fetchStoryList];
}

-(void)mjPull
{
    ++self.page;
    [self fetchStoryList];
}

#pragma mark
-(void)fetchStoryList{
    [[FJService instance].homeService fetchInfomationListAtpage:self.page listType:self.listType successBlock:^(NSArray* infoLiteList, BOOL allFetch) {
        if (self.page==1) {
            [self.infoLiteList removeAllObjects];
        }
        if (infoLiteList.count) {
            [self.infoLiteList addObjectsFromArray:infoLiteList];
            [self.tableView reloadData];
        }
        [self.tableView.mj_header endRefreshing];
        if (allFetch==YES){
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }else
        {
            [self.tableView.mj_footer endRefreshing];
        }
    } failureBlock:^(NSString *msg) {
        [self.view at_postMessage:msg];
    }];
}
#pragma mark
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.infoLiteList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FJInfomationListCell *cell = [tableView dequeueReusableCellWithIdentifier:[FJInfomationListCell cellId] forIndexPath:indexPath];
    cell.infomationLite = self.infoLiteList[indexPath.row];
    return cell;
}

#pragma mark
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 119;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FJInfomationLite *infoLite = self.infoLiteList[indexPath.row];
    FJInfomationDetailController *controller = [[FJInfomationDetailController alloc] init];
    controller.infoId = infoLite.infoId;
    controller.infoTitle = infoLite.title;
    [self.navigationController pushViewController:controller animated:YES];
}
#pragma mark
-(NSMutableArray*)infoLiteList{
    if (!_infoLiteList) {
        _infoLiteList = [NSMutableArray array];
    }
    return _infoLiteList;
}
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[FJInfomationListCell class] forCellReuseIdentifier:[FJInfomationListCell cellId]];
    }
    return _tableView;
}

@end
