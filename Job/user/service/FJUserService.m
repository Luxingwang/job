//
//  FJUserService.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJUserLoginCommand.h"
#import "FJUserService.h"
#import "FJNetworkCommand.h"
@implementation FJUserService
+(FJUserService*)instance{
    static FJUserService *service = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        service = [[FJUserService alloc] init];
    });
    return service;
}

-(void)fetchFastLoginVertifyCodeAtPhoneNum:(NSString*)phone successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;
{
    if (phone.length!=11) {
        errorBlock(@"请输入正确格式手机号");
    }else
    {
        FJNetworkCommand *command = [[FJNetworkCommand alloc] init];
        NSDictionary *params = @{@"phone":phone};
        command.errorBlock = errorBlock;
        command.successBlock = successBlock;
        [command sendRequestWithUrl:URLForge(@"/user/getCode") method:POST parameter:params];
    }
}

-(void)fastLoginVertifyCodeAtPhoneNum:(NSString*)phone code:(NSString*)code successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    if (phone.length!=11) {
        errorBlock(@"请输入正确格式手机号");
        return;
    }
    if (code.length==0) {
        errorBlock(@"请输入验证码");
        return;
    }
    FJUserLoginCommand *command = [[FJUserLoginCommand alloc] init];
    command.errorBlock = errorBlock;
    command.successBlock = successBlock;
    NSDictionary *params = @{@"phone":phone,
                             @"code":code
                             };
    command.params = params;
    [command execute];
}

-(void)accountLoginVertifyCodeAtPhoneNum:(NSString*)phone password:(NSString*)password successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    if (phone.length!=11) {
        errorBlock(@"请输入正确格式手机号");
        return;
    }
    if (password.length==0) {
        errorBlock(@"请输入密码");
        return;
    }
    FJUserLoginCommand *command = [[FJUserLoginCommand alloc] init];
    command.errorBlock = errorBlock;
    command.successBlock = successBlock;
    NSDictionary *params = @{@"phone":phone,
                             @"password":password
                             };
    command.params = params;
    [command execute];
}

-(void)fetchUserRelatedJobListAtType:(UserRelatedJobListType)listType successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJUserJobListCommand *command = [[FJUserJobListCommand alloc] init];
    command.listType = listType;
    command.errorBlock = errorBlock;
    command.successBlock = successBlock;
    [command execute];
}
@end
