//
//  FJSettingController.m
//  Job
//
//  Created by 小黑胖 on 2018/10/4.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJSettingController.h"
#import "FJMessageSetupController.h"
#import "TitleArrowCell.h"
#import "FJService.h"
#import "FJUser.h"
#import "FJAppDelegate.h"
#import "FJAppLaunch.h"
#import "UIControl+BlocksKit.h"
#import "UIAlertView+BlocksKit.h"

@interface FJSettingController ()
@property (nonatomic, strong) FJUser *user;

@end

@implementation FJSettingController

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
    self.navigationItem.title = @"设置";
    self.titleList = @[@[@"消息设置", @"手机号", @"设置密码"], @[@"版本更新", @"关于我们", @"用户协议"]];
    [self setupTableView];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)setupTableView
{
    UIButton *loginOutButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginOutButton setTitle:@"退出登录" forState:UIControlStateNormal];
    [loginOutButton setTitleColor:[UIColor at_colorWithHex:0xE60012] forState:UIControlStateNormal];
    loginOutButton.titleLabel.font = [UIFont systemFontOfSize:14];
    loginOutButton.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = loginOutButton;
    loginOutButton.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.frame), 50);
    [loginOutButton bk_addEventHandler:^(id sender) {
        UIAlertView *alertView = [UIAlertView bk_showAlertViewWithTitle:@"退出登录" message:@"确定退出登录？" cancelButtonTitle:@"取消" otherButtonTitles:@[@"确定"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex) {
                [self loginOut];
            }
        }];
        [alertView show];
    } forControlEvents:UIControlEventTouchUpInside];
}

- (void)loginOut
{
    FJAppDelegate *appDelegate = (FJAppDelegate *)[[UIApplication sharedApplication] delegate];
    FJAppLaunch *appLaunch = [appDelegate valueForKey:@"appLaunch"];
    [[FJService instance].userLocalService.localUser setValue:nil forKey:@"userId"];
    SEL sel = NSSelectorFromString(@"startLoginUI");
    if ([appLaunch respondsToSelector:sel]) {
        SuppressPerformSelectorLeakWarning (
        [appLaunch performSelector:sel];
        );
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 52;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return !section ? CGFLOAT_MIN : 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TitleArrowCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TitleArrowCell class])];
    cell.title = self.titleList[indexPath.section][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            Class class = NSClassFromString(!indexPath.row ? @"FJMessageSetupController" : indexPath.row == 1 ? @"FJBindPhoneController" : @"FJPasswordController");
            SEL sel = indexPath.row == 1 ? NSSelectorFromString(@"initWithPhone:") : NSSelectorFromString(@"init");
            if ([class instancesRespondToSelector:sel]) {
                if (indexPath.row == 1) {
                    // todo:
                    SuppressPerformSelectorLeakWarning (
                    [self.navigationController pushViewController:[[class alloc]performSelector:sel withObject:self.user.phone] animated:YES];
                    );
                }
                else {
                    SuppressPerformSelectorLeakWarning (
                    [self.navigationController pushViewController:[[class alloc]performSelector:sel] animated:YES];
                    );
                }
            }
        }
            break;
        case 1:
            
            break;
            
        default:
            break;
    }

}

@end
