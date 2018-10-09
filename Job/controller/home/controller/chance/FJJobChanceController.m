//
//  FJJobChanceController.m
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJService.h"
#import "FJJobCell.h"
#import "MJRefresh.h"
#import "UIView+Extension.h"
#import "FJJobChanceController.h"

@interface FJJobChanceController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSMutableArray *jobList;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation FJJobChanceController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self initConstraints];
    [self fetchJobList];
    self.navigationItem.title = @"工作机会";
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
-(void)fetchJobList
{
    [[FJService instance].jobListService fetchJobListSuccessBlock:^(NSArray*jobList) {
        [self handleJobList:jobList];
    } failureBlock:^(NSString *msg) {
        [self.view at_postMessage:msg];
    }];
}

-(void)handleJobList:(NSArray*)jobList
{
    [self.jobList addObjectsFromArray:jobList];
    [self.tableView reloadData];
}

#pragma mark
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.jobList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FJJobCell *cell = [tableView dequeueReusableCellWithIdentifier:[FJJobCell cellId] forIndexPath:indexPath];
    cell.job = self.jobList[indexPath.row];
    return cell;
}

#pragma mark
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 112;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
#pragma mark
-(NSMutableArray*)jobList{
    if (!_jobList) {
        _jobList = [NSMutableArray array];
    }
    return _jobList;
}

#pragma mark
-(UITableView*)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[FJJobCell class] forCellReuseIdentifier:[FJJobCell cellId]];
    }
    return _tableView;
}
@end
