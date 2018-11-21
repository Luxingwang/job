//
//  FJWorkController.m
//  Job
//
//  Created by XXX on 2018/10/16.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJWorkController.h"
#import "SDJTextViewController.h"
#import "SDJPastDatePicker.h"
#import "FJUserWorkService.h"
#import "BlocksKit+UIKit.h"
#import "NSDate+String.h"

@interface FJWorkController ()
@property (nonatomic, strong) FJUser *user;
@property (nonatomic, copy) void (^callBack)(void);
@end

@implementation FJWorkController
- (instancetype)initWithUser:(FJUser *)user completionCallBack:(void (^)(void))callBack
{
    if (self = [super init]) {
        self.user = user;
        self.callBack = callBack;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"工作经历";
    self.titleList = @[@[@"公司", @"职位", @"所属部门", @"入职时间", @"离职时间", @"工作内容", @"工作业绩"], @[@"对这家公司隐蔽我的信息"]];
    [self addBottomButtonWithActionBlock:^{
        // 完成Action
        [[FJUserWorkService instance]userWorkHandleWithUserwork:self.user successBlock:^(id data) {
            !self.callBack ?: self.callBack();
            [self.navigationController popViewControllerAnimated:YES];
        } failureBlock:nil];
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.titleList[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return !section ? 0 : 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TitleArrowCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TitleArrowCell class])];
    cell.title = self.titleList[indexPath.section][indexPath.row];
    cell.arrow.hidden = indexPath.section;
    if (indexPath.section) {
        [cell.uiSwitch setOn:self.userWork.hasHide animated:YES];
        [cell setSwitchBlock:^(BOOL isOn){
            self.userWork.hasHide = isOn;
        }];
    }
    else {
        if (indexPath.row < 3) {
            cell.textField.placeholder = !indexPath.row ? @"公司名称" : indexPath.row == 1 ? @"服务职位" : @"选填";
            NSString *key = !indexPath.row ? @"companyName" : indexPath.row == 1 ? @"postName" : @"department";
            cell.textField.text = [self.userWork valueForKey:key];
            @WeakSelf(self);
            cell.textFieldBlock = ^(NSString * _Nonnull text) {
                [weakSelf.userWork setValue:text forKey:key];
            };
        }
        else {
            NSString *key = indexPath.row == 3 ? @"beginDateString" : indexPath.row == 4 ? @"endDateString" : indexPath.row == 5 ? @"workContent" : @"achievement";
            cell.detailLabel.text = [self.userWork valueForKey:key];
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TitleArrowCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row > 2 && indexPath.row < 5) {
        SDJPastDatePicker *picker = [[SDJPastDatePicker alloc]initWithTitle:cell.title type:PastDatePickerTypeBirthday];
        [picker showView];
        @WeakSelf(picker);
        [picker setDoneBlock:^{
            [self.userWork setValue:weakSelf.selectedDate forKey:indexPath.row == 3 ? @"beginDate" : @"endDate"];
            [weakSelf hideView];
            cell.detailLabel.text = [weakSelf.selectedDate fullDateString];
        }];
        return;
    }
    
    if (indexPath.row > 4) {
        NSString *placeholder = @[@"请简要描述您在该公司的工作内容", @"请详细描述您在该岗位上取得的工作业绩 \n例如： \n1.取得的业绩... \n2.实现的突破... \n3.获得的表彰..."][indexPath.row - 5];
        [self.navigationController pushViewController:[[SDJTextViewController alloc]initWithTitle:cell.title placeholder:placeholder noTextTips:nil doneHandler:^(SDJTextViewController *textVC, NSString *text) {
            cell.detailLabel.text = text;
            [self.userWork setValue:text forKey:indexPath.row - 5 == 0 ? @"workContent" : @"achievement"];
        }] animated:YES];
    }
}

- (FJUserWork *)userWork
{
    return self.user.userWork;
}

@end
