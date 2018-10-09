//
//  FJInterviewedController.m
//  Job
//
//  Created by 小黑胖 on 2018/10/4.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJService.h"
#import "FJActiveJobCell.h"
#import "UIColor+Extension.h"
#import "FJInterviewedController.h"

@interface FJInterviewedController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *jobList;

@end

@implementation FJInterviewedController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"已面试的职位";
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
-(void)fecthJobList{
    
}
#pragma mark
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.jobList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FJActiveJobCell *cell = [tableView dequeueReusableCellWithIdentifier:[FJActiveJobCell cellId] forIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
        [_tableView registerClass:[FJActiveJobCell class] forCellReuseIdentifier:[FJActiveJobCell cellId]];
    }
    return _tableView;
}
@end
