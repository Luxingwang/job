//
//  FJResumePreviewController.m
//  Job
//
//  Created by XXX on 2018/10/31.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJResumePreviewController.h"
#import "FJResumeBasicInfoCell.h"
#import "FJResumeYearContentCell.h"
#import "FJResumeCareerCell.h"
#import "FJResumeWorkCell.h"
#import "FJResumeEduCell.h"

@interface FJResumePreviewController()
@property (nonatomic, strong) FJResumeBasicInfoCell *basicInfoCell;
@property (nonatomic, strong) FJResumeYearContentCell *yearCell;

@end
@implementation FJResumePreviewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"简历预览";
    [self setupTableView];
}

- (void)setupTableView
{
    [self.tableView registerClass:[FJResumeCareerCell class] forCellReuseIdentifier:NSStringFromClass([FJResumeCareerCell class])];
    [self.tableView registerClass:[FJResumeWorkCell class] forCellReuseIdentifier:NSStringFromClass([FJResumeWorkCell class])];
    [self.tableView registerClass:[FJResumeEduCell class] forCellReuseIdentifier:NSStringFromClass([FJResumeEduCell class])];
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
    FJResumeEduCell *eduCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FJResumeEduCell class])];
    FJResumeWorkCell *workCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FJResumeWorkCell class])];
    FJResumeCareerCell *careerCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([FJResumeCareerCell class])];
    if (!indexPath.section) {
        return self.basicInfoCell;
    }
    if (indexPath.section == 1) {
        return self.yearCell;
    }
    if (indexPath.section == 2) {
        return careerCell;
    }
    if (indexPath.section == 3) {
        return workCell;
    }
    if (indexPath.section == 4) {
    }
    return eduCell;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
