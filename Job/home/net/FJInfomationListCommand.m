//
//  FJInfomationListCommand.m
//  Job
//
//  Created by 小黑胖 on 2018/10/9.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJInfomationLite.h"
#import "FJInfomationListCommand.h"

@implementation FJInfomationListCommand
-(NSString*)networkUrl
{
    if (self.listType==InfomationListTypeStory) {
       return URLForge(@"/home/story/list");
    }
    return URLForge(@"/app/information/news/list");
}

-(void)execute
{
    [self sendRequestWithUrl:self.networkUrl method:POST];
}

-(void)successHandle:(id)data
{
    NSArray *list = [data objectForKey:@"list"];
    NSMutableArray *storyList = [FJInfomationLite arrayFrom:list];
    self.successBlock(storyList);
}
@end
