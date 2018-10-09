//
//  FJHomeDynamicsListCommand.m
//  Job
//
//  Created by 小黑胖 on 2018/10/9.
//  Copyright © 2018年 lxw. All rights reserved.
//

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
//    NSMutableArray *jobs = [FJJob arrayFrom:data];
//    self.successBlock(jobs);
}
@end
