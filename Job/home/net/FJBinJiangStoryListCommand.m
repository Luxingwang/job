//
//  FJBinJiangStoryListCommand.m
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJBinJiangStory.h"
#import "FJBinJiangStoryListCommand.h"

@implementation FJBinJiangStoryListCommand
-(NSString*)networkUrl
{
    return URLForge(@"/home/story/list");
}

-(void)execute
{
    [self sendRequestWithUrl:self.networkUrl method:POST];
}

-(void)successHandle:(id)data
{
    NSArray *list = [data objectForKey:@"list"];
    NSMutableArray *storyList = [FJBinJiangStory arrayFrom:list];
    self.successBlock(storyList);
}
@end
