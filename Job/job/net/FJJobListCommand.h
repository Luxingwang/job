//
//  FJJobListCommand.h
//  Job
//
//  Created by 小黑胖 on 2018/10/10.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJNetworkCommand.h"

@interface FJJobListCommand : FJNetworkCommand
@property (nonatomic,weak) NSMutableDictionary *params;
@end
