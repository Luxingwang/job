//
//  FJJobListCommand.m
//  Job
//
//  Created by 小黑胖 on 2018/10/10.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJJob.h"
#import "FJJobListCommand.h"

@implementation FJJobListCommand
-(NSString*)networkUrl
{
    return URLForge(@"/app/posts/query");
}

-(void)execute
{
    [self sendRequestWithUrl:self.networkUrl method:POST parameter:self.params];
}

-(void)successHandle:(id)data
{
    NSArray *list = [data objectForKey:@"list"];
    NSMutableArray *jobList = [FJJob arrayFrom:list];
    self.successBlock(jobList);
}
@end
