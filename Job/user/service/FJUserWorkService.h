//
//  FJUserWorkService.h
//  Job
//
//  Created by XXX on 2018/10/18.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FJNetworkCommand.h"
#import "FJUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface FJUserWorkService : NSObject
+ (FJUserWorkService*)instance;

/**
 获得简历详情
 
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
- (void)getResumeWithSuccessBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;

/**
 编辑用户数据
 
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
- (void)editedUserInfoWithUser:(FJUser *)user successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;

/**
 获得行业数据（通用）

 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
- (void)getIndustryWithSuccessBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;

/**
 获得数据字典（目前包括学历信息、收入水平）
 
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
- (void)getDataDictionaryWithSuccessBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;

/**
 添加工作经历

 @param userWork userWork description
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
- (void)userWorkHandleWithUserwork:(FJUser *)userWork successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;

/**
 添加教育经历
 
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
- (void)userEduHandleWithUseredu:(FJUser *)userEdu successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;

/**
 添加项目经历
 
 @param successBlock successBlock description
 @param errorBlock errorBlock description
 */
- (void)userProjectHandleWithUserproject:(FJUser *)userProject successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;


@end

NS_ASSUME_NONNULL_END
