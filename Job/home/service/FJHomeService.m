//
//  FJHomeService.m
//  Job
//
//  Created by 小黑胖 on 2018/10/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJHomeService.h"
#import "FJHomeEntranceItem.h"
#import "FJRecommendJobsCommand.h"
#import "FJHomeDynamicsListCommand.h"
#import "FJBinJiangStoryListCommand.h"
#import "FJExcellentStudentCompanyJobCommand.h"
@implementation FJHomeService
+(FJHomeService*)instance{
    static FJHomeService *service = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        service = [[FJHomeService alloc] init];
    });
    return service;
}

-(void)fetchDynamicsListSuccessBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJHomeDynamicsListCommand *command = [[FJHomeDynamicsListCommand alloc] init];
    command.errorBlock = errorBlock;
    command.successBlock = successBlock;
    [command execute];
}

-(void)fetchRecommendJobListAtPage:(NSInteger)page successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJRecommendJobsCommand *command = [[FJRecommendJobsCommand alloc] init];
    command.page = page;
    command.errorBlock = errorBlock;
    command.successBlock = successBlock;
    [command execute];
}

-(void)fetchBinJiangStoryListSuccessBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJBinJiangStoryListCommand *command = [[FJBinJiangStoryListCommand alloc] init];
    command.errorBlock = errorBlock;
    command.successBlock = successBlock;
    [command execute];
}

-(void)fetchExcellentStudentListAtSize:(NSInteger)size successBlock:(SUCCESS_BLOCK)successBlock failureBlock:(FAILURE_BLOCK)errorBlock
{
    FJExcellentStudentCompanyJobCommand *command = [[FJExcellentStudentCompanyJobCommand alloc] init];
    command.size = size;
    command.errorBlock = errorBlock;
    command.successBlock = successBlock;
    [command execute];
}

#pragma mark
-(NSMutableArray*)entranceItems{
    if (!_entranceItems) {
        _entranceItems = [NSMutableArray array];
        NSArray *items = @[@{@"title":@"滨江故事",
                             @"imgName":@"img_home_item_story"
                             },
                           @{@"title":@"工作机会",
                             @"imgName":@"img_home_item_job"
                             },
                           @{@"title":@"企业动态",
                             @"imgName":@"img_home_item_enterprise"
                             },
                           @{@"title":@"优秀生直通车",
                             @"imgName":@"img_home_item_student"
                             },
                           ];
        [_entranceItems addObjectsFromArray:[FJHomeEntranceItem arrayFrom:items]];
    }
    return _entranceItems;
}
@end
