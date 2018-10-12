//
//  FJJobListService.h
//  Job
//
//  Created by 小黑胖 on 2018/10/10.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJNetworkCommand.h"
#import <Foundation/Foundation.h>

@interface FJJobListService : NSObject
+(FJJobListService*)instance;
@property (nonatomic,strong) NSMutableDictionary *params;
-(void)fetchJobListSuccessBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;
@end
