//
//  FJStoryListController.m
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJService.h"
#import "UIView+Extension.h"
#import "FJBinJiangStoryCell.h"
#import "FJStoryListController.h"
#import "FJStoryDetailController.h"
@interface FJStoryListController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *storyList;
@end

@implementation FJStoryListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self initConstraints];
    [self fetchStoryList];
    self.navigationItem.title = @"滨江故事";
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
#pragma mark
-(void)fetchStoryList{
    [self.view at_postLoading];
    [[FJService instance].homeService fetchBinJiangStoryListSuccessBlock:^(NSMutableArray *storyList) {
        [self.view at_hideLoading];
        if (storyList.count) {
            [self.storyList addObjectsFromArray:storyList];
            [self.tableView reloadData];
        }
    } failureBlock:^(NSString *msg) {
        [self.view at_postMessage:msg];
    }];
}
#pragma mark
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.storyList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FJBinJiangStoryCell *cell = [tableView dequeueReusableCellWithIdentifier:[FJBinJiangStoryCell cellId] forIndexPath:indexPath];
    cell.story = self.storyList[indexPath.row];
    return cell;
}

#pragma mark
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 119;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FJBinJiangStory *story = self.storyList[indexPath.row];
    FJStoryDetailController *controller = [[FJStoryDetailController alloc] init];
    controller.storyId = story.storyId;
    [self.navigationController pushViewController:controller animated:YES];
}
#pragma mark
-(NSMutableArray*)storyList{
    if (!_storyList) {
        _storyList = [NSMutableArray array];
    }
    return _storyList;
}
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[FJBinJiangStoryCell class] forCellReuseIdentifier:[FJBinJiangStoryCell cellId]];
    }
    return _tableView;
}
@end
