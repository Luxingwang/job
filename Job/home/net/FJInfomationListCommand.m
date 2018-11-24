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
    NSDictionary *params = @{@"pageNo":@(self.page)};
    [self sendRequestWithUrl:self.networkUrl method:POST parameter:params];
}

-(void)successHandle:(id)data
{
    NSArray *list = [data objectForKey:@"list"];
    NSMutableArray *storyList = [FJInfomationLite arrayFrom:list];
    NSDictionary *pageInfo = [data objectForKey:@"page"];
    NSInteger totalPage = [[pageInfo objectForKey:@"totalPages"] integerValue];
    BOOL allFetch = self.page == totalPage?YES:NO;
    self.pageSuccessBlock(storyList,allFetch);
}
@end
