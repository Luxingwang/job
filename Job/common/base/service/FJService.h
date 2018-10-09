//
//  FJService.h
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FJJobService.h"
#import "FJHomeService.h"
#import "FJUserService.h"
#import "FJNetworkService.h"
#import "FJJobListService.h"
#import "FJUserLocalUserService.h"
@interface FJService : NSObject
@property (nonatomic,weak) FJJobService  *jobService;
@property (nonatomic,weak) FJHomeService *homeService;
@property (nonatomic,weak) FJUserService *userService;
@property (nonatomic,weak) FJJobListService *jobListService;
@property (nonatomic,weak) FJNetworkService *networkService;
@property (nonatomic,weak) FJUserLocalUserService *userLocalService;
+(FJService*)instance;
@end
