//
//  FJMeController.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJMeInfoCell.h"
#import "FJMeEntranceCell.h"
#import "FJMeController.h"

@interface FJMeController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation FJMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubViews];
    [self initConstraints];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark
-(void)setUpSubViews{
    [self.view addSubview:self.tableView];
}
#pragma mark
-(void)initConstraints{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section==0?1:4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        FJMeInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:[FJMeInfoCell cellId] forIndexPath:indexPath];
        return cell;
    }
    FJMeEntranceCell *cell = [tableView dequeueReusableCellWithIdentifier:[FJMeEntranceCell cellId] forIndexPath:indexPath];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section==0?194:61;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc]init];
}
#pragma mark
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor redColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.sectionFooterHeight = 10;
        [_tableView registerClass:[FJMeInfoCell class] forCellReuseIdentifier:[FJMeInfoCell cellId]];
        [_tableView registerClass:[FJMeEntranceCell class] forCellReuseIdentifier:[FJMeEntranceCell cellId]];
    }
    return _tableView;
}
@end
