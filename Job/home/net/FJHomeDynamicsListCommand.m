//
//  FJHomeDynamicsListCommand.m
//  Job
//
//  Created by 小黑胖 on 2018/10/9.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJInfomationLite.h"
#import "FJHomeDynamicsListCommand.h"

@implementation FJHomeDynamicsListCommand
-(NSString*)networkUrl
{
    return URLForge(@"/home/page");
}

-(void)execute
{
    [self sendRequestWithUrl:self.networkUrl method:POST];
}

-(void)successHandle:(id)data
{
    NSArray *dynamicsList = [FJInfomationLite arrayFrom:[data objectForKey:@"informationList"]];
    self.successBlock(dynamicsList);
}
@end
