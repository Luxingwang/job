//
//  FJWorkController.m
//  Job
//
//  Created by XXX on 2018/10/16.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJProjectController.h"
#import "SDJTextViewController.h"
#import "FJUserWorkService.h"
#import "SDJPastDatePicker.h"
#import "BlocksKit+UIKit.h"
#import "NSDate+String.h"

@interface FJProjectController ()
@property (nonatomic, strong) FJUser *user;
@property (nonatomic, copy) void (^callBack)(void);

@end

@implementation FJProjectController

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
    self.title = @"项目经历";
    
    self.titleList = @[@"项目", @"角色", @"开始时间", @"结束时间", @"项目描述"];
    
    [self addBottomButtonWithActionBlock:^{
        // 完成Action
        // todo://
        [[FJUserWorkService instance]userProjectHandleWithUserproject:self.user successBlock:^(id data) {
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TitleArrowCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TitleArrowCell class])];
    cell.title = self.titleList[indexPath.section];
    if (indexPath.section < 2) {
        cell.textField.placeholder = !indexPath.section ? @"项目名称" : @"您在项目中的职位";
        cell.textField.text = [self.userProject valueForKey:!indexPath.section ? @"projectName" : @"roleName"];
        cell.textFieldBlock = ^(NSString * _Nonnull text) {
            [self.userProject setValue:text forKey:!indexPath.section ? @"projectName" : @"roleName"];
        };
    }
    else {
        cell.detailLabel.text = indexPath.section == 4 ? self.userProject.projectDesc : indexPath.section == 2 ? self.userProject.beginDateString : self.userProject.endDateString;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TitleArrowCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.section > 1) {
        if (indexPath.section == 2 || indexPath.section == 3) {
            SDJPastDatePicker *picker = [[SDJPastDatePicker alloc]initWithTitle:cell.title type:PastDatePickerTypeBirthday];
            [picker showView];
            @WeakSelf(picker);
            [picker setDoneBlock:^{
                [self.userProject setValue:weakSelf.selectedDate forKey:indexPath.section == 2 ? @"beginDate" : @"endDate"];
                [weakSelf hideView];
                cell.detailLabel.text = [weakSelf.selectedDate fullDateString];
            }];
        }
        else {
            NSString *placeholder = @"请简要描述您在该项目中的工作内容";
            [self.navigationController pushViewController:[[SDJTextViewController alloc]initWithTitle:cell.title placeholder:placeholder noTextTips:nil doneHandler:^(SDJTextViewController *textVC, NSString *text) {
                cell.detailLabel.text = text;
                [self.userProject setValue:text forKey:@"projectDesc"];
            }] animated:YES];
        }
    }
}

- (FJUserProject *)userProject
{
    return self.user.userProject;
}

@end
