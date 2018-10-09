//
//  FJBinJiangStory.m
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJBinJiangStory.h"

@implementation FJBinJiangStory
+(NSMutableArray*)arrayFrom:(NSArray*)array
{
    return [FJBinJiangStory mj_objectArrayWithKeyValuesArray:array];
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"storyId" : @"id",
             };
}
@end
