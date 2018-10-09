//
//  FJRecommendJobsCommand.m
//  Job
//
//  Created by 小黑胖 on 2018/10/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJJob.h"
#import "FJRecommendJobsCommand.h"

@implementation FJRecommendJobsCommand
-(NSString*)networkUrl
{
    return URLForge(@"/app/posts/recommend/list");
}

-(void)execute
{
    NSDictionary *param = @{@"pageSize":@(20),
                            @"pageNo":@(self.page)
                            };
    [self sendRequestWithUrl:self.networkUrl method:POST parameter:param];
}

-(void)successHandle:(id)data
{
    NSMutableArray *jobs = [FJJob arrayFrom:data];
    self.successBlock(jobs);
}
@end
