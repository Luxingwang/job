//
//  FJUserService.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//

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

-(void)fetchFastLoginVertifyCode:(NSString*)phone
{
    phone = @"15824178622";
    FJNetworkCommand *command = [[FJNetworkCommand alloc] init];
    [command sendRequestWithUrl:@"https://api.windwalker.club/user/getCode" method:POST parameter:@{@"phone":phone,@"os":@"ios",@"version":@"1.0.1"}];
}

@end
