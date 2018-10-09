//
//  FJNetworkService.h
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FJNetworkCommand.h"
@interface FJNetworkService : NSObject
+(FJNetworkService*)instance;

-(void)networkWithUrl:(NSString*)url method:(REQUEST_TYPE)type successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;

-(void)networkWithUrl:(NSString*)url method:(REQUEST_TYPE)type parameter:(NSDictionary*)params successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;
@end
