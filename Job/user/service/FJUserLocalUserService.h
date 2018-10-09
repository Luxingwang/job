//
//  FJUserLocalUserService.h
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJUser+Extension.h"
#import <Foundation/Foundation.h>

@interface FJUserLocalUserService : NSObject
@property (nonatomic,strong) FJUser *localUser;
+(FJUserLocalUserService*)instance;
@end
