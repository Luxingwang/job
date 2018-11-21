//
//  FJUserWorkService.m
//  Job
//
//  Created by XXX on 2018/10/18.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJUserWorkService.h"
#import "FJUserWorkCommond.h"

@implementation FJUserWorkService
+ (FJUserWorkService*)instance
{
    static FJUserWorkService *service = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        service = [[FJUserWorkService alloc] init];
    });
    return service;
}

- (void)getResumeWithSuccessBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJUserWorkCommond *userWorkCommond = [[FJUserWorkCommond alloc] initWithUser:nil successBlock:successBlock errorBlock:errorBlock];
    userWorkCommond.type = FJResumeCommondTypeGetDetail;
    [userWorkCommond execute];
}

- (void)editedUserInfoWithUser:(FJUser *)user successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJUserWorkCommond *userWorkCommond = [[FJUserWorkCommond alloc] initWithUser:user successBlock:successBlock errorBlock:errorBlock];
    userWorkCommond.type = FJResumeCommondTypeEditedUserInfo;
    [userWorkCommond execute];
}

- (void)getIndustryWithSuccessBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJUserWorkCommond *userWorkCommond = [[FJUserWorkCommond alloc] initWithUser:nil successBlock:successBlock errorBlock:errorBlock];
    userWorkCommond.type = FJResumeCommondTypeGetIndustry;
    [userWorkCommond execute];
}

- (void)getDataDictionaryWithSuccessBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJUserWorkCommond *userWorkCommond = [[FJUserWorkCommond alloc] initWithUser:nil successBlock:successBlock errorBlock:errorBlock];
    userWorkCommond.type = FJResumeCommondTypeGetDataDictionary;
    [userWorkCommond execute];
}

- (void)userWorkHandleWithUserwork:(FJUser *)userWork successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJUserWorkCommond *userWorkCommond = [[FJUserWorkCommond alloc] initWithUser:userWork successBlock:successBlock errorBlock:errorBlock];
    userWorkCommond.type = userWork.userWork.workId.integerValue ? FJResumeCommondTypeEditWork : FJResumeCommondTypeAddWork;
    [userWorkCommond execute];
}

- (void)userEduHandleWithUseredu:(FJUser *)userEdu successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJUserWorkCommond *userWorkCommond = [[FJUserWorkCommond alloc] initWithUser:userEdu successBlock:successBlock errorBlock:errorBlock];
    userWorkCommond.type = userEdu.userEdu.eduId.integerValue ? FJResumeCommondTypeEditEdu : FJResumeCommondTypeAddEdu;
    [userWorkCommond execute];
}

- (void)userProjectHandleWithUserproject:(FJUser *)userProject successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJUserWorkCommond *userWorkCommond = [[FJUserWorkCommond alloc] initWithUser:userProject successBlock:successBlock errorBlock:errorBlock];
    userWorkCommond.type = userProject.userProject.projectId.integerValue ? FJResumeCommondTypeEditProject : FJResumeCommondTypeAddProject;
    [userWorkCommond execute];
}
@end
