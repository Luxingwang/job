//
//  FJUserService.h
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJUserJobListCommand.h"
#import <Foundation/Foundation.h>

@interface FJUserService : NSObject
+(FJUserService*)instance;
/**
 获取快速登录验证码
 @param phone 手机号
 */
-(void)fetchFastLoginVertifyCodeAtPhoneNum:(NSString*)phone successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;

/**
 快速登录
 @param phone 手机号
 @param code 验证码
 */
-(void)fastLoginVertifyCodeAtPhoneNum:(NSString*)phone code:(NSString*)code successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;

/**
 账户密码登录
 @param phone 手机号
 @param password 密码
 */
-(void)accountLoginVertifyCodeAtPhoneNum:(NSString*)phone password:(NSString*)password successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;
/**
 跟用户有关的职位列表
 */
-(void)fetchUserRelatedJobListAtType:(UserRelatedJobListType)listType successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;

@end
