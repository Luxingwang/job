//
//  FJService.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJService.h"

@implementation FJService
+(FJService*)instance{
    static FJService *service = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        service = [[FJService alloc] init];
    });
    return service;
}

-(FJHomeService*)homeService
{
    return [FJHomeService instance];
}

-(FJUserService*)userService
{
    return [FJUserService instance];
}

-(FJNetworkService*)networkService
{
    return [FJNetworkService instance];
}

-(FJUserLocalUserService*)userLocalService
{
    return [FJUserLocalUserService instance];
}
@end
