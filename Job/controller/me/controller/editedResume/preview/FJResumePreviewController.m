//
//  FJResumePreviewController.m
//  Job
//
//  Created by XXX on 2018/10/31.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJResumePreviewController.h"

@implementation FJResumePreviewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"简历预览";
    [self setupTableView];
}

- (void)setupTableView
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return !indexPath.section ? 100 : 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
