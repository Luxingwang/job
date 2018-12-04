//
//  EditedResumeController.m
//  Job
//
//  Created by XXX on 2018/10/15.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJMeInfoController.h"
#import "TitleArrowCell.h"
#import "FJUserWorkService.h"
#import "SDJTextView.h"
#import "NSDate+String.h"
#import "UIBarButtonItem+BlocksKit.h"
#import "SDJPastDatePicker.h"
#import "SDJTypePicker.h"
#import "BlocksKit+UIKit.h"
#import "NSDate+String.h"
#import "UIImagePickerController+BlocksKit.h"
#import "FJUser.h"
#import "UIView+Extension.h"

@interface FJMeInfoController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) FJUser *user;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, strong) UIImagePickerController *imagePickerController;
@property (nonatomic, strong) TitleArrowCell *logoCell;

@end

/**
 提示：缺少必要参数
 */
@implementation FJMeInfoController

- (instancetype)initWithUser:(FJUser *)user
{
    if (self = [super init]) {
        self.user = user;
    }
    return self;
}

- (void)viewDidLoad {
    self.isGrouped = YES;
    [super viewDidLoad];
    self.navigationItem.title = @"个人信息";
    weakify(self)
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]bk_initWithTitle:@"保存" style:UIBarButtonItemStylePlain handler:^(id sender) {
        strongify(self)
        [self loadData];
    }];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)setupTableView
{
    self.tableView.sectionHeaderHeight = CGFLOAT_MIN;
    
    SDJTextView *textView = [[SDJTextView alloc]init];
    textView.textColor = [UIColor at_colorWithHex:0x9FA0A0];
    [textView setTextEditingChangeBlock:^(NSString *text) {
        self.user.des = text;
    }];
    textView.text = self.user.des;
    textView.placeholder = @"一句话描述自己";
    textView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 115);
    self.tableView.tableFooterView = textView;
}

- (void)loadData
{
    [[FJUserWorkService instance] editedUserInfoWithUser:self.user successBlock:^(id data) {
    } failureBlock:^(NSString *msg) {
        
    }];
}

- (void)uploadImage:(UIImage *)image
{
    [self.view at_postLoading];
    [[FJUserWorkService instance] uploadWithImage:image successBlock:^(id data) {
        [self.view at_hideLoading];
        [self.logoCell.iconImageView sd_setImageWithURL:[NSURL URLWithString:(NSString *)data] placeholderImage:[UIImage imageNamed:@"me_icon_avater"]];
    } failureBlock:^(NSString *msg) {
        
    }];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return !indexPath.row ? 83 : 52;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 头像
    if (!indexPath.row) {
        [self.logoCell.iconImageView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"me_icon_avater"]];
        return self.logoCell;
    }
    TitleArrowCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TitleArrowCell class])];
    cell.title = self.array[indexPath.row];
    // 姓名 手机号
    if (indexPath.row == 1 || indexPath.row == 7) {
        cell.textField.placeholder = @"请输入";
        NSString *key = indexPath.row == 1 ? @"realName" : @"phone";
        cell.textField.text = [self.user valueForKey:key];
        weakify(self)
        cell.textFieldBlock = ^(NSString * _Nonnull text) {
            strongify(self)
            [self.user setValue:text forKey:key];
        };
    }
    else {
        NSString *key = indexPath.row == 2 ? @"sex" : indexPath.row == 3 ? @"birthday" : indexPath.row == 4 ? @"education" : indexPath.row == 5 ? @"graduationTimeString" : indexPath.row == 6 ? @"firstWorkTimeString" : @"phone";
        if (indexPath.row == 2) {
            cell.detailLabel.text = [[self.user valueForKey:key] isEqual:@"FEMALE"] ? @"女" : @"男";
        }
        else{
            cell.detailLabel.text = [self.user valueForKey:key];
        }
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TitleArrowCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    if (!indexPath.row) {
        UIActionSheet *sheet = [UIActionSheet bk_actionSheetWithTitle:nil];
        [sheet bk_addButtonWithTitle:@"从相册选择" handler:^{
            self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            [self presentViewController:self.imagePickerController animated:YES completion:nil];
        }];
        [sheet bk_addButtonWithTitle:@"拍照" handler:^{
            self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:self.imagePickerController animated:YES completion:nil];
        }];
        [sheet bk_setCancelButtonWithTitle:@"取消" handler:nil];
        [sheet showInView:self.view];
    }
    // 性别 // 最高学历
    if (indexPath.row == 2 || indexPath.row == 4) {
        
        NSArray *array = indexPath.row == 2 ? @[@"男", @"女"] : self.educationArray;
        SDJTypePicker *picker = [[SDJTypePicker alloc]initWithTitle:cell.title stringSource:array];
        picker.selectedString = cell.detailLabel.text;
        [picker showView];
        __block NSString *value = @"";
        weakify(self)
        weakify(picker)
        [picker setDoneBlock:^{
            strongify(self)
            strongify(picker)
            [picker hideView];
            cell.detailLabel.text = picker.selectedString;
            if (indexPath.row == 2) {
                value = [picker.selectedString isEqualToString:@"男"] ? @"MALE" : @"FEMALE";
            }
            else {
                value = picker.selectedString;
            }
            [self.user setValue:value forKey:indexPath.row == 2 ? @"sex" : @"education"];
        }];
    }
    
    // Date
    if (indexPath.row == 3 || indexPath.row == 5 || indexPath.row == 6 ) {
        SDJPastDatePicker *picker = [[SDJPastDatePicker alloc]initWithTitle:cell.title type:PastDatePickerTypeBirthday];
        [picker showView];
        weakify(self)
        weakify(picker)
        [picker setDoneBlock:^{
            strongify(self)
            strongify(picker)
            [picker hideView];
            cell.detailLabel.text = [picker.selectedDate fullDateString];
            [self.user setValue:[picker.selectedDate fullDateString] forKey:indexPath.row == 3 ? @"birthday" : indexPath.row == 5 ? @"graduationTime" : @"firstWorkTime"];
        }];
    }
    
}

- (NSArray *)array
{
    if (!_array) {
        _array = @[@"头像" , @"姓名", @"性别", @"出生年月", @"最高学历", @"毕业时间", @"参加工作时间", @"手机号"];
    }
    return _array;
}

- (NSArray *)educationArray
{
    NSDictionary *dicT = [[NSUserDefaults standardUserDefaults] valueForKey:@"GeneralDictionary"];
    return dicT[@"EDUCATION"];
}

- (UIImagePickerController *)imagePickerController
{
    if (!_imagePickerController) {
        _imagePickerController = [[UIImagePickerController alloc]init];
        weakify(self)
        [_imagePickerController setBk_didFinishPickingMediaBlock:^(UIImagePickerController *imagePickerController,  NSDictionary *info) {
            strongify(self)
            // 获取图片
            UIImage *image = info[UIImagePickerControllerOriginalImage];
            [self dismissViewControllerAnimated:YES completion:nil];
            [self uploadImage:image];
        }];
        [_imagePickerController setBk_didCancelBlock:^(UIImagePickerController *picker) {
            strongify(self)
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    }
    return _imagePickerController;
}

- (TitleArrowCell *)logoCell
{
    if (!_logoCell) {
        _logoCell = [[TitleArrowCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
        _logoCell.title = self.array[0];
        _logoCell.isIconRight = YES;
    }
    return _logoCell;
}

@end
