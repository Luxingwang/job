//
//  FJUserSetupService.h
//  Job
//
//  Created by XXX on 2018/10/30.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FJNetworkCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface FJUserSetupService : NSObject
+ (FJUserSetupService*)instance;

/**
 设置手机号/修改手机号
 
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
- (void)editPhoneWithPhone:(NSString *)phone password:(NSString *)password successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;

/**
 设置手机号获取验证码
 
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
- (void)getPhoneCodeWithPhone:(NSString *)phone successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;

/**
 设置密码
 
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
- (void)editPasswordWithPhone:(NSString *)phone password:(NSString *)password successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;
@end

NS_ASSUME_NONNULL_END
