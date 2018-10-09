//
//  FJJob.m
//  Job
//
//  Created by 小黑胖 on 2018/10/4.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJJob.h"

@implementation FJJob
+(NSMutableArray*)arrayFrom:(NSArray*)array
{
    return [FJJob mj_objectArrayWithKeyValuesArray:array];
}
@end
