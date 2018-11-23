//
//  FJUserSetupService.m
//  Job
//
//  Created by XXX on 2018/10/30.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJUserSetupService.h"
#import "FJUserSetupCommond.h"

@implementation FJUserSetupService
+ (FJUserSetupService*)instance
{
    static FJUserSetupService *service = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        service = [[FJUserSetupService alloc] init];
    });
    return service;
}

- (void)getPhoneCodeWithPhone:(NSString *)phone successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJUserSetupCommond *userWorkCommond = [[FJUserSetupCommond alloc] initWithParams:@{@"phone" : phone} successBlock:successBlock errorBlock:errorBlock];
    userWorkCommond.type = FJUserSetupCommondTypeGetPhoneCode;
    [userWorkCommond execute];
}

- (void)editPhoneWithPhone:(NSString *)phone code:(NSString *)code successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJUserSetupCommond *userWorkCommond = [[FJUserSetupCommond alloc] initWithParams:
                                                                    @{@"phone" : phone,
                                                                      @"code" : code,
                                                                      @"userId" : @(1)
                                                                      } successBlock:successBlock errorBlock:errorBlock];
    userWorkCommond.type = FJUserSetupCommondTypeEditPhone;
    [userWorkCommond execute];
}

- (void)editPasswordWithPhone:(NSString *)phone password:(NSString *)password successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    
}


@end
