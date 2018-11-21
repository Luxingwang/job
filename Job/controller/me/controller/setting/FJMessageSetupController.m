//
//  FJMessageSetupController.m
//  Job
//
//  Created by XXX on 2018/10/16.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJMessageSetupController.h"
#import "TitleArrowCell.h"
@interface FJMessageSetupController ()<UITableViewDelegate, UITableViewDataSource>
@end

@implementation FJMessageSetupController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息设置";
    self.titleList = @[@"邀约通知、面试通知等消息的推送", @"聊天消息在通知栏的推送"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 52;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TitleArrowCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TitleArrowCell class])];
    [cell hiddenArraw];
    cell.title = self.titleList[indexPath.row];
    [cell uiSwitch];
    return cell;
}

@end
