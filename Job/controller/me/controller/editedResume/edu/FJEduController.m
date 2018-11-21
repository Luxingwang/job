//
//  FJWorkController.m
//  Job
//
//  Created by XXX on 2018/10/16.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJEduController.h"
#import "SDJTextViewController.h"
#import "FBAttachmentUploadVC.h"
#import "SDJPastDatePicker.h"
#import "SDJTypePicker.h"
#import "FJUserWorkService.h"
#import "BlocksKit+UIKit.h"
#import "NSDate+String.h"

@interface FJEduController ()
@property (nonatomic, strong) FJUser *user;
@property (nonatomic, strong) NSDictionary *dataDictionary;
@property (nonatomic, strong) NSArray *eduList;
@property (nonatomic, copy) void (^callBack)(void);

@end

@implementation FJEduController

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
    
    self.title = FormatString(@"%@教育经历", self.user.userEdu.eduId.length ? @"编辑" : @"添加");
    
    self.titleList = @[@[@"学校", @"专业", @"学历", @"入学时间", @"毕业时间"], @[@"在校经历", @"荣誉证书"]];
    
    [self addBottomButtonWithActionBlock:^{
        // 完成Action
        [[FJUserWorkService instance]userEduHandleWithUseredu:self.user successBlock:^(id data) {
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
    if (indexPath.row < 2 && !indexPath.section) {
        cell.textField.placeholder = !indexPath.row ? @"学校名称" : @"所学专业";
        NSString *key = !indexPath.row ? @"school" : @"profession";
        cell.textField.text = [self.userEdu valueForKey:key];
        cell.textFieldBlock = ^(NSString * _Nonnull text) {
            [self.userEdu setValue:text forKey:key];
        };
    }
    else {
        NSString *key;
        if (!indexPath.section) {
            key = indexPath.row == 2 ? @"education" : indexPath.row == 3 ? @"beginDateString" : @"endDateString";
        }
        else {
            key = !indexPath.row ? @"des" : @"certificateImgs";
        }
        NSString *text = indexPath.row == 2 ? self.educationArray[[[self.userEdu valueForKey:key] integerValue]] : [self.userEdu valueForKey:key];
        cell.detailLabel.text = text;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TitleArrowCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 2) {
        SDJTypePicker *picker = [[SDJTypePicker alloc]initWithTitle:cell.title stringSource:self.educationArray];
        picker.selectedString = cell.detailLabel.text;
        @WeakSelf(picker);
        [picker showView];
        [picker setDoneBlock:^{
            [weakSelf hideView];
            cell.detailLabel.text = weakSelf.selectedString;
            [self.userEdu setValue:weakSelf.selectedString forKey:@"education"];
        }];
        return;
    }
    
    if (indexPath.row > 2 && indexPath.row < 5) {
        SDJPastDatePicker *picker = [[SDJPastDatePicker alloc]initWithTitle:cell.title type:PastDatePickerTypeBirthday];
        [picker showView];
        @WeakSelf(picker);
        [picker setDoneBlock:^{
            [self.userEdu setValue:weakSelf.selectedDate forKey:indexPath.row == 3 ? @"beginDate" : @"endDate"];
            [weakSelf hideView];
            cell.detailLabel.text = [weakSelf.selectedDate fullDateString];
        }];
        return;
    }
    
    if (indexPath.section == 1) {
        if (!indexPath.row) {
            NSString *placeholder = @"请简要描述您在该学校的学习内容";
            [self.navigationController pushViewController:[[SDJTextViewController alloc]initWithTitle:cell.title placeholder:placeholder noTextTips:nil doneHandler:^(SDJTextViewController *textVC, NSString *text) {
                cell.detailLabel.text = text;
                [self.userEdu setValue:text forKey:@"des"];
            }] animated:YES];
        }
        else {
            FBAttachmentUploadVC *vc = [[FBAttachmentUploadVC alloc]initWithImageArray:@[]];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}

- (void)setDataDictionary:(NSDictionary *)dataDictionary
{
    _dataDictionary = dataDictionary;
    
    // 学历
    self.eduList = dataDictionary[@"EDUCATION"];
}

- (NSArray *)educationArray
{
    NSDictionary *dicT = [[NSUserDefaults standardUserDefaults] valueForKey:@"GeneralDictionary"];
    return dicT[@"EDUCATION"];
}

- (FJUserEdu *)userEdu
{
    return self.user.userEdu;
}

@end
