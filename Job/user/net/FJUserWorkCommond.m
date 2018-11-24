//
//  FJUserWorkCommond.m
//  Job
//
//  Created by XXX on 2018/10/18.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJUserWorkCommond.h"
#import "FJIndustry.h"
#import "NSDate+String.h"

@interface FJUserWorkCommond()
@property (nonatomic, strong) FJUser *user;
@property (nonatomic, strong) NSArray *funcArray;
@property (nonatomic, strong) NSArray *responseArray;
@end
@implementation FJUserWorkCommond
- (instancetype)initWithUser:(FJUser *__nullable)user successBlock:(SUCCESS_BLOCK)successBlock errorBlock:(FAILURE_BLOCK)errorBlock
{
    if (self = [super init]) {
        self.successBlock = successBlock;
        self.errorBlock = errorBlock;
        self.user = user;
    }
    return self;
}

- (void)execute
{
    SuppressPerformSelectorLeakWarning (
    [self performSelector:NSSelectorFromString(self.funcArray[self.type])];
     );
}

- (void)errorHandle:(NSString *)msg
{
    
}

- (void)successHandle:(id)data
{
    NSLog(@"%@", [data mj_JSONString]);
    SuppressPerformSelectorLeakWarning (
    [self performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@Response:", self.funcArray[self.type]]) withObject:data];
    );
}

- (void)getDetail
{
    [self sendRequestWithUrl:URLForge(@"/user/resume/detail") method:POST parameter:nil];
}

- (void)getDetailResponse:(id)data
{
    self.successBlock([FJUser mj_objectWithKeyValues:data]);
}

- (void)editedUserInfo
{
    NSMutableDictionary *mutableParams = [NSMutableDictionary dictionary];
    [@[@"realName", @"sex", @"birthday", @"education", @"graduationTime", @"firstWorkTime", @"phone", @"description"]bk_each:^(NSString *obj) {
        if ([obj isEqual:@"graduationTime"]) {
            mutableParams[@"graduationTime"] = self.user.graduationTimeString;
        }
        else if ([obj isEqual:@"firstWorkTime"]) {
            mutableParams[@"firstWorkTime"] = self.user.firstWorkTimeString;
        }
        else if ([obj isEqual:@"description"]) {
            mutableParams[@"description"] = self.user.des;
        }
        else {
            [mutableParams setValue:self.user.mj_keyValues[obj] forKey:obj];
        }
    }];

    self.user.userId = @"1";
    mutableParams[@"userId"] = self.user.userId;
    [self sendRequestWithUrl:URLForge(@"/user/edit") method:POST parameter:mutableParams];
}

- (void)editedUserInfoResponse:(id)data
{
    self.successBlock([FJUser mj_objectWithKeyValues:data]);
}

- (void)getIndustry
{
    [self sendRequestWithUrl:URLForge(@"/app/conf/industry") method:POST parameter:nil];
}

- (void)getIndustryResponse:(id)data
{
    NSArray *array = [data valueForKey:@"list"];
    self.successBlock([FJIndustry mj_objectArrayWithKeyValuesArray:array]);
}

- (void)getDataDictionary
{
    id data = [[NSUserDefaults standardUserDefaults] valueForKey:@"GeneralDictionary"];
    if (data) {
        self.successBlock(data);
        return;
    }
    [self sendRequestWithUrl:URLForge(@"/app/conf/dictionary") method:POST parameter:nil];
}

- (void)getDataDictionaryResponse:(id)data
{
    [[NSUserDefaults standardUserDefaults] setValue:data forKey:@"GeneralDictionary"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    self.successBlock(data);
}


- (void)handleWork
{
    NSMutableDictionary *mutableParams = self.user.userWork.mj_keyValues;
    mutableParams[@"beginDate"] = self.user.userEdu.beginDateString;
    mutableParams[@"endDate"] = self.user.userEdu.endDateString;
    self.user.userId = @"1";
    mutableParams[@"userId"] = self.user.userId;
    if (self.user.userWork.workId.length) {
        mutableParams[@"id"] = self.user.userWork.workId;
    }
    NSString *url = FormatString(@"/user/resume/company/%@", self.type == FJResumeCommondTypeAddEdu ? @"add" : @"update");
    [self sendRequestWithUrl:URLForge(url) method:POST parameter:mutableParams];
}

- (void)handleWorkResponse:(id)data
{
    self.successBlock(data);
}

- (void)handleEdu
{
    NSMutableDictionary *mutableParams = self.user.userEdu.mj_keyValues;
    mutableParams[@"description"] = mutableParams[@"des"];
    [mutableParams removeObjectForKey:@"des"];
    mutableParams[@"beginDate"] = self.user.userEdu.beginDateString;
    mutableParams[@"endDate"] = self.user.userEdu.endDateString;
    self.user.userId = @"1";
    mutableParams[@"userId"] = self.user.userId;
    if (self.user.userEdu.eduId.length) {
        mutableParams[@"id"] = self.user.userEdu.eduId;
    }
    NSString *url = FormatString(@"/user/resume/edu/%@", self.type == FJResumeCommondTypeAddEdu ? @"add" : @"update");
    [self sendRequestWithUrl:URLForge(url) method:POST parameter:mutableParams];
}

- (void)handleEduResponse:(id)data
{
    self.successBlock(data);
}

- (void)handleProject
{
    NSMutableDictionary *mutableParams = self.user.userProject.mj_keyValues;
    mutableParams[@"beginDate"] = self.user.userProject.beginDateString;
    mutableParams[@"endDate"] = self.user.userProject.endDateString;
    self.user.userId = @"1";
    mutableParams[@"userId"] = self.user.userId;
    if (self.user.userProject.projectId.length) {
        mutableParams[@"id"] = self.user.userProject.projectId;
    }
    NSString *url = FormatString(@"/user/resume/project/%@", self.type == FJResumeCommondTypeAddEdu ? @"add" : @"update");
    [self sendRequestWithUrl:URLForge(url) method:POST parameter:mutableParams];
}

- (void)handleProjectResponse:(id)data
{
    self.successBlock(data);
}

- (NSString *)formatUrl
{
    return self.type % 2 == 0 ? @"add" : @"edit";
}

- (NSArray *)funcArray
{
    if (!_funcArray) {
        _funcArray = @[@"getDetail", @"editedUserInfo", @"getIndustry", @"getDataDictionary" ,@"handleEdu", @"handleEdu", @"handleWork", @"handleWork", @"handleProject", @"handleProject"];
    }
    return _funcArray;
}

@end
