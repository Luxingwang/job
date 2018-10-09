//
//  FJJobListService.m
//  Job
//
//  Created by 小黑胖 on 2018/10/10.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJJobListCommand.h"
#import "FJJobListService.h"

@implementation FJJobListService
+(FJJobListService*)instance{
    static FJJobListService *service = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        service = [[FJJobListService alloc] init];
        service.params = [NSMutableDictionary dictionary];
    });
    return service;
}
-(void)fetchJobListSuccessBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJJobListCommand *command = [[FJJobListCommand alloc] init];
    command.params = self.params;
    command.errorBlock = errorBlock;
    command.successBlock = successBlock;
    [command execute];
}
@end
