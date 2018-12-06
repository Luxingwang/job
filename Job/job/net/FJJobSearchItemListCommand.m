//
//  FJJobSearchItemListCommand.m
//  Job
//
//  Created by 小黑胖 on 2018/12/7.
//  Copyright © 2018 lxw. All rights reserved.
//
#import "FJJobSearchCategory.h"
#import "FJJobSearchItemListCommand.h"

@implementation FJJobSearchItemListCommand
-(NSString*)networkUrl
{
    return URLForge(@"/app/conf/dictionary");
}

-(void)execute
{
    [self sendRequestWithUrl:self.networkUrl method:POST];
}

-(void)successHandle:(id)data
{
    NSArray *searchCategorys = [FJJobSearchCategory arrayFrom:data];
    self.successBlock(searchCategorys);
}

@end
