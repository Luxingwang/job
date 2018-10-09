//
//  FJNetworkService.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJNetworkService.h"

@implementation FJNetworkService
+(FJNetworkService*)instance{
    static FJNetworkService *service = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        service = [[FJNetworkService alloc] init];
    });
    return service;
}

-(void)networkWithUrl:(NSString*)url method:(REQUEST_TYPE)type successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    [self networkWithUrl:url method:type parameter:nil successBlock:successBlock failureBlock:errorBlock];
}


-(void)networkWithUrl:(NSString*)url method:(REQUEST_TYPE)type parameter:(NSDictionary*)params successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJNetworkCommand *command = [[FJNetworkCommand alloc] init];
    command.errorBlock = errorBlock;
    command.successBlock = successBlock;
    [command sendRequestWithUrl:url method:type parameter:params];
}
@end
