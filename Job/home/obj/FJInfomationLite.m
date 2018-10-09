//
//  FJInfomationLite.m
//  Job
//
//  Created by 小黑胖 on 2018/10/9.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJInfomationLite.h"

@implementation FJInfomationLite
+(NSMutableArray*)arrayFrom:(NSArray*)array
{
    return [FJInfomationLite mj_objectArrayWithKeyValuesArray:array];
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"infoId" : @"id",
             };
}
@end
