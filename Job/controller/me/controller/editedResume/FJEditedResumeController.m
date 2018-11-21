//
//  EditedResumeController.m
//  Job
//
//  Created by XXX on 2018/10/15.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJEditedResumeController.h"
#import "FJMeInfoController.h"
#import "FJCareerController.h"
#import "FJMessageSetupController.h"
#import "FJResumePreviewController.h"
#import "TitleArrowCell.h"
#import "FJEditedFooterAddView.h"
#import "FJEditedResumeHeaderView.h"
#import "FJUser.h"
#import "FJUserWorkService.h"
#import "NSDate+String.h"
#import "UIBarButtonItem+BlocksKit.h"

@interface FJEditedResumeController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) FJUser *user;
@property (nonatomic, strong) NSArray *array;
@end

@implementation FJEditedResumeController

- (void)viewDidLoad {
    self.isGrouped = YES;
    [super viewDidLoad];
    self.navigationItem.title = @"编辑简历";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]bk_initWithTitle:@"预览" style:UIBarButtonItemStylePlain handler:^(id sender) {
        FJResumePreviewController *controller = [[FJResumePreviewController alloc]init];
        [self.navigationController pushViewController:controller animated:YES];
    }];
    
    [self setupTableView];
    [self loadData];
    [self requsetDataDictionary];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)setupTableView
{
    [self.tableView registerClass:[FJEditedFooterAddView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([FJEditedFooterAddView class])];
    [self.tableView registerClass:[FJEditedResumeHeaderView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([FJEditedResumeHeaderView class])];
}

- (void)loadData
{
    [[FJUserWorkService instance] getResumeWithSuccessBlock:^(id data) {        self.user = data;

        [self.tableView reloadData];
    } failureBlock:nil];
}

- (void)requsetDataDictionary
{
    [[FJUserWorkService instance]getDataDictionaryWithSuccessBlock:^(id data) {
    } failureBlock:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!section) {
        return 3;
    }
    NSString *keyPath = section == 1 ? @"_user.educationList" : section == 2 ? @"_user.companyList" : @"_user.projectList";
    return [[self valueForKeyPath:keyPath] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (!section) {
        return CGFLOAT_MIN;
    }
    NSString *keyPath = section == 1 ? @"_user.educationList" : section == 2 ? @"_user.companyList" : @"_user.projectList";
    return [[self valueForKeyPath:keyPath] count] > 0 ? 57 : 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *emptyHeaderView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
    FJEditedResumeHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([FJEditedResumeHeaderView class])];
    NSString *keyPath = section == 1 ? @"_user.educationList" : section == 2 ? @"_user.companyList" : @"_user.projectList";
    NSInteger arrayCount = [[self valueForKeyPath:keyPath] count];
    if (arrayCount) {
        headerView.title = self.array[section - 1];
    }
    return arrayCount > 0 ? headerView : emptyHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return !indexPath.row && !indexPath.section ? 83 : 52;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return !section ? CGFLOAT_MIN : 53;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    FJEditedFooterAddView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:NSStringFromClass([FJEditedFooterAddView class])];
    view.title = self.array[section - 1];
    view.addBlock = ^{
        [self pushNextControllerWithIsAdd:YES indexPath:[NSIndexPath indexPathWithIndex:section]];
    };
    return view;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TitleArrowCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TitleArrowCell class])];
    
    if (!indexPath.section) {
        switch (indexPath.row) {
                case 0:
            {
                cell.title = @"";
                cell.detailLabel.text = @"编辑个人信息";
                [cell.iconImageView sd_setImageWithURL:nil placeholderImage:nil];
            }
                break;
                case 1:
                cell.title = @"求职意向";
                cell.detailLabel.text = @"";
                break;
                case 2:
                cell.title = @"附件简历";
                cell.detailLabel.text = @"未上传";
                break;
                
            default:
                break;
        }
    }
    else {
        NSString *keyPath = indexPath.section == 1 ? @"_user.educationList" : indexPath.section == 2 ? @"_user.companyList" : @"_user.projectList";
        id userData = [self valueForKeyPath:keyPath][indexPath.row];
        NSString *key = indexPath.section == 1 ? @"school" : indexPath.section == 2 ? @"companyName" : @"projectName";
        cell.title = [userData valueForKey:key];
        cell.detailLabel.text = FormatString(@"%@-%@", [[userData beginDate] stringWithDateFormat:@"yy年MM月"], [[userData endDate] stringWithDateFormat:@"yy年MM月"]);
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 个人信息
    if (!indexPath.section) {
        [self.navigationController pushViewController:!indexPath.row ? [[FJMeInfoController alloc]initWithUser:self.user] : indexPath.row == 1 ? [[FJCareerController alloc]init] : nil animated:YES];
        return;
    }
    // 添加相关
    [self pushNextControllerWithIsAdd:NO indexPath:indexPath];
}

- (void)pushNextControllerWithIsAdd:(BOOL)isAdd indexPath:(NSIndexPath *)indexPath
{
    SEL sel = NSSelectorFromString(@"initWithUser:completionCallBack:");
    Class class = NSClassFromString(@[@"FJEduController", @"FJWorkController", @"FJProjectController"][indexPath.section - 1]);
    FJUser *user;
    if (isAdd) {
        user = [[FJUser alloc]initWithType:indexPath.section - 1];
    }
    else {
        NSString *keyPath = indexPath.section == 1 ? @"_user.educationList" : indexPath.section == 2 ? @"_user.companyList" : @"_user.projectList";
        id userData = [self valueForKeyPath:keyPath][indexPath.row];
        user = self.user;
        [user setValue:userData forKey:indexPath.section == 1 ? @"userEdu" : indexPath.section == 2 ? @"userWork" : @"userProject"];
    }
    
    void (^callBack)(void) = ^() {
        [self loadData];
    };
    SuppressPerformSelectorLeakWarning (
    [self.navigationController pushViewController:[[class alloc] performSelector:sel withObject:user withObject:callBack] animated:YES];
    );
}

- (NSArray *)array
{
    if (!_array) {
        _array = @[@"教育经历", @"工作经历", @"项目经历"];
    }
    return _array;
}

- (FJUser *)user
{
    if (!_user) {
        _user = [[FJUser alloc]init];
    }
    return _user;
}
@end
