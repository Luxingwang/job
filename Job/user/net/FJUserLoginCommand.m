//
//  FJUserLoginCommand.m
//  Job
//
//  Created by 小黑胖 on 2018/10/11.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJUserLoginCommand.h"

@implementation FJUserLoginCommand
-(NSString*)networkUrl
{
    return URLForge(@"/user/login");
}

-(void)execute
{
    [self sendRequestWithUrl:self.networkUrl method:POST parameter:self.params];
}

-(void)successHandle:(id)data
{
    
}
@end
