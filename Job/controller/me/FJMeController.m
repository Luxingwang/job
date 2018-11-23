//
//  FJMeController.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJMeInfoCell.h"
#import "FJMeController.h"
#import "FJMeEntranceCell.h"
#import "FJSettingController.h"
#import "FJTalkedController.h"
#import "FJExchangeController.h"
#import "FJDeliveredControler.h"
#import "FJCollectedController.h"
#import "FJAttachmentController.h"
#import "FJInterviewedController.h"
#import "FJEditedResumeController.h"
#import "FJUserWorkService.h"

@interface FJMeController ()<UITableViewDelegate,UITableViewDataSource,FJMeInfoCellDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *entranceInfoList;
@property (nonatomic, strong) FJUser *user;
@end

@implementation FJMeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor at_colorWithHex:0xf4f4f4];
    
    [self setUpSubViews];
    [self initConstraints];
    
    [self loadData];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)loadData
{
    [[FJUserWorkService instance] getResumeWithSuccessBlock:^(id data) {
        self.user = data;
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationNone];
    } failureBlock:^(NSString *msg) {
        
    }];
}

#pragma mark
-(void)setUpSubViews{
    [self.view addSubview:self.tableView];
}
#pragma mark
-(void)initConstraints{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

#pragma mark
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section<2?1:3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        FJMeInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:[FJMeInfoCell cellId] forIndexPath:indexPath];
        cell.delegate = self;
        cell.user = self.user;
        return cell;
    }
    FJMeEntranceCell *cell = [tableView dequeueReusableCellWithIdentifier:[FJMeEntranceCell cellId] forIndexPath:indexPath];
    cell.infoDictionary = indexPath.section==1?self.entranceInfoList[0]:self.entranceInfoList[indexPath.row+1];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section==0?194:61;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc]init];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 编辑个人简历
    if (!indexPath.section) {
        [self.navigationController pushViewController:[[FJEditedResumeController alloc]init] animated:YES];
    }
    else if (indexPath.section==1)
    {
        FJAttachmentController *controller = [[FJAttachmentController alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    else if (indexPath.section==2)
    {
        if (indexPath.row==0)
        {
            FJExchangeController *controller = [[FJExchangeController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }
        else if (indexPath.row==1)
        {
            FJCollectedController *controller = [[FJCollectedController alloc] init];
            [self.navigationController pushViewController:controller animated:YES];
        }else if (indexPath.row==2)
        {
            FJSettingController *controller = [[FJSettingController alloc] initWithUser:self.user];
            [self.navigationController pushViewController:controller animated:YES];
        }
    }
}

#pragma mark
-(void)didSelectMeDeliveredAtCell:(FJBaseTableViewCell*)cell{
    FJDeliveredControler *controller = [[FJDeliveredControler alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)didSelectMeTalkededAtCell:(FJBaseTableViewCell*)cell{
    FJTalkedController *controller = [[FJTalkedController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

-(void)didSelectMeInterviewedAtCell:(FJBaseTableViewCell*)cell{
    FJInterviewedController *controller = [[FJInterviewedController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark
-(UITableView*)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.sectionFooterHeight = 10;
        _tableView.tableFooterView = [UIView new];
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[FJMeInfoCell class] forCellReuseIdentifier:[FJMeInfoCell cellId]];
        [_tableView registerClass:[FJMeEntranceCell class] forCellReuseIdentifier:[FJMeEntranceCell cellId]];
    }
    return _tableView;
}
-(NSArray*)entranceInfoList{
    if (!_entranceInfoList) {
        _entranceInfoList = @[@{@"title":@"附件简历",
                                @"imgName":@"img_me_attachment"
                                },
                              @{@"title":@"匿名/实名交流",
                                @"imgName":@"img_me_talk"
                                },
                              @{@"title":@"收藏",
                                @"imgName":@"img_me_collection"
                                },
                              @{@"title":@"设置",
                                @"imgName":@"img_me_setting"
                                }];
    }
    return _entranceInfoList;
}

@end
