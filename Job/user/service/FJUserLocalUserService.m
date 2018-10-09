//
//  FJUserLocalUserService.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJUserLocalUserService.h"

@implementation FJUserLocalUserService
+(FJUserLocalUserService*)instance{
    static FJUserLocalUserService *service = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        service = [[FJUserLocalUserService alloc] init];
        service.localUser = [[FJUser alloc] init];
    });
    return service;
}
@end
