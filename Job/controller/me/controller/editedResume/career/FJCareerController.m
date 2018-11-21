//
//  EditedResumeController.m
//  Job
//
//  Created by XXX on 2018/10/15.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJCareerController.h"
#import "ManageEditTagsViewController.h"
#import "FJUserWorkService.h"
#import "TitleArrowCell.h"
#import "NSDate+String.h"
#import "FJUser.h"

@interface FJCareerController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) FJUser *user;
@property (nonatomic, strong) NSArray *array;
@end

@implementation FJCareerController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"求职意向";
    
    [self setupTableView];
    [self loadData];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)setupTableView
{
    
}

- (void)loadData
{

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 52;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TitleArrowCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TitleArrowCell class])];
    cell.title = self.array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        ManageEditTagsViewController *editTagsViewController = [[ManageEditTagsViewController alloc]initWithAlreadyTagList:nil];
        [self.navigationController pushViewController:editTagsViewController animated:YES];
        [editTagsViewController setSaveTagsBlock:^(NSArray *array) {
            if ([array count]) {
                
            }
        }];
    }

}

- (NSArray *)array
{
    if (!_array) {
        _array = @[@"期望职位", @"期望行业", @"性质", @"期望薪水"];
    }
    return _array;
}

@end
