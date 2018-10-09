//
//  FJHomeService.h
//  Job
//
//  Created by 小黑胖 on 2018/10/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJNetworkCommand.h"
#import <Foundation/Foundation.h>

@interface FJHomeService : NSObject
+(FJHomeService*)instance;
@property (nonatomic,strong) NSMutableArray *entranceItems;
/**
 获取首页动态
 */
-(void)fetchDynamicsListSuccessBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;
/**
 获取首页推荐工作列表
 @param page 页码
 */
-(void)fetchRecommendJobListAtPage:(NSInteger)page successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;
/**
 获取滨江故事列表
 */
-(void)fetchBinJiangStoryListSuccessBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;
/**
 获取优秀生直通车
 @param size 页码
 */
-(void)fetchExcellentStudentListAtSize:(NSInteger)size successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock;
@end
