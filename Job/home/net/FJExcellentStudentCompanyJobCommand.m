//
//  FJExcellentStudentCompanyJobCommand.m
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJExcellentStudentCompanyJob.h"
#import "FJExcellentStudentCompanyJobCommand.h"

@implementation FJExcellentStudentCompanyJobCommand
-(NSString*)networkUrl
{
    return URLForge(@"/home/company/recommend");
}

-(void)execute
{
    NSDictionary *param = [NSMutableDictionary dictionary];
    if (self.size) {
        [param setValue:@(self.size) forKey:@"size"];
    }
    [self sendRequestWithUrl:self.networkUrl method:POST parameter:param];
}

-(void)successHandle:(id)data
{
    NSMutableArray *storyList = [FJExcellentStudentCompanyJob arrayFrom:data];
    self.successBlock(storyList);
}
@end
