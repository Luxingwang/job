//
//  FJUserSetupCommond.m
//  Job
//
//  Created by XXX on 2018/10/30.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJUserSetupCommond.h"
#import "FJUser.h"

@interface FJUserSetupCommond()
@property (nonatomic, strong) NSDictionary *params;
@property (nonatomic, strong) NSArray *funcArray;

@end
@implementation FJUserSetupCommond
- (instancetype)initWithParams:(NSDictionary *)params successBlock:(SUCCESS_BLOCK)successBlock errorBlock:(FAILURE_BLOCK)errorBlock
{
    if (self = [super init]) {
        self.successBlock = successBlock;
        self.errorBlock = errorBlock;
        self.params = params;
    }
    return self;
}

- (void)execute
{
    SuppressPerformSelectorLeakWarning (
        [self performSelector:NSSelectorFromString(self.funcArray[self.type])];
    );
}

- (void)successHandle:(id)data
{
    NSLog(@"%@", [data mj_JSONString]);
    SuppressPerformSelectorLeakWarning (

    [self performSelector:NSSelectorFromString([NSString stringWithFormat:@"%@Response:", self.funcArray[self.type]]) withObject:data];
    );
}

- (void)editPhone
{
    [self sendRequestWithUrl:URLForge(@"/user/bindPhone") method:POST parameter:nil];
}

- (void)editPhoneResponse:(id)data
{
    self.successBlock([FJUser mj_objectWithKeyValues:data]);
}

- (void)getPhoneCode
{
    [self sendRequestWithUrl:URLForge(@"/user/getCode") method:POST parameter:nil];
}

- (void)getPhoneCodeResponse:(id)data
{
    self.successBlock([FJUser mj_objectWithKeyValues:data]);
}

- (void)editPassword
{
    [self sendRequestWithUrl:URLForge(@"/user/resume/detail") method:POST parameter:nil];
}

- (void)editPasswordResponse:(id)data
{
    self.successBlock([FJUser mj_objectWithKeyValues:data]);
}

- (void)messageNotice
{
    [self sendRequestWithUrl:URLForge(@"/user/resume/detail") method:POST parameter:nil];
}

- (void)messageNoticeResponse:(id)data
{
    self.successBlock([FJUser mj_objectWithKeyValues:data]);
}

- (NSArray *)funcArray
{
    if (!_funcArray) {
        _funcArray = @[@"editPhone", @"getPhoneCode", @"editPassword", @"messageNotice"];
    }
    return _funcArray;
}

@end
