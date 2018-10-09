//
//  FJInfomationListCommand.h
//  Job
//
//  Created by 小黑胖 on 2018/10/9.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "info.h"
#import "FJNetworkCommand.h"
@interface FJInfomationListCommand : FJNetworkCommand
@property (nonatomic,assign) InfomationListType listType;
@end
