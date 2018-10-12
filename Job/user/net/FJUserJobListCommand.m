//
//  FJUserJobListCommand.m
//  Job
//
//  Created by 小黑胖 on 2018/10/11.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJJob.h"
#import "FJUserJobListCommand.h"
@interface FJUserJobListCommand()
@property (nonatomic,strong) NSMutableDictionary *params;
@end
@implementation FJUserJobListCommand
-(instancetype)init{
    self = [super init];
    if (self) {
        _params = [NSMutableDictionary dictionary];
    }
    return self;
}

-(NSString*)networkUrl
{
    return URLForge(@"/user/post/list");
}

-(void)execute
{
    if (self.listType==UserRelatedJobListTypeCollected)
    {
        [self.params setObject:@"COLLECT" forKey:@"type"];
    }
    else if (self.listType==UserRelatedJobListTypeDeliveredReached)
    {
        [self.params setObject:@"SEND" forKey:@"type"];
    }
    else if (self.listType==UserRelatedJobListTypeDeliveredReaded)
    {
        [self.params setObject:@"READ" forKey:@"type"];
    }
    else if (self.listType==UserRelatedJobListTypeDeliveredImproper)
    {
        [self.params setObject:@"REFUSED" forKey:@"type"];
    }
    else if (self.listType==UserRelatedJobListTypeDeliveredTalked)
    {
        [self.params setObject:@"TRACE" forKey:@"type"];
    }
    else if (self.listType==UserRelatedJobListTypeDeliveredInterviewed)
    {
        [self.params setObject:@"INTERVIEW" forKey:@"type"];
    }
    
    [self sendRequestWithUrl:self.networkUrl method:POST parameter:self.params];
}

-(void)successHandle:(id)data
{
    NSArray *list = [data objectForKey:@"list"];
    NSMutableArray *jobList = [FJJob arrayFrom:list];
    self.successBlock(jobList);
}
@end
