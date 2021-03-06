//
//  FJCollectedController.m
//  Job
//
//  Created by 小黑胖 on 2018/10/4.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJService.h"
#import "FJJobCell.h"
#import "UIView+Extension.h"
#import "UIColor+Extension.h"
#import "FJCollectedController.h"

@interface FJCollectedController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *jobList;

@end

@implementation FJCollectedController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self initConstraints];
    [self fecthUserCollectedJobList];
    self.navigationItem.title = @"已收藏的职位";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
-(void)setUpSubviews{
    [self.view addSubview:self.tableView];
}

-(void)initConstraints{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark
-(void)fecthUserCollectedJobList{
    [self.view at_postLoading];
    [[FJService instance].userService fetchUserRelatedJobListAtType:UserRelatedJobListTypeCollected successBlock:^(NSArray*jobList) {
        [self.view at_hideLoading];
        if (jobList.count) {
            [self.jobList addObjectsFromArray:jobList];
        }
        [self.tableView reloadData];
    } failureBlock:^(NSString *msg) {
        [self.view at_postMessage:msg];
    }];
}
#pragma mark
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.jobList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FJJobCell *cell = [tableView dequeueReusableCellWithIdentifier:[FJJobCell cellId] forIndexPath:indexPath];
    cell.job = self.jobList[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 112;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark
-(NSMutableArray*)jobList{
    if (!_jobList) {
        _jobList = [NSMutableArray array];
    }
    return _jobList;
}
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[FJJobCell class] forCellReuseIdentifier:[FJJobCell cellId]];
    }
    return _tableView;
}
@end
