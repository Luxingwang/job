//
//  FJExcellentStudentCompanyJob.m
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJExcellentStudentCompanyJob.h"

@implementation FJExcellentStudentCompanyJob
+(NSMutableArray*)arrayFrom:(NSArray*)array
{
    return [FJExcellentStudentCompanyJob mj_objectArrayWithKeyValuesArray:array];
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{
             @"companyJobId" : @"id",
             @"companyLogoUrl": @"LOGO"
             };
}
@end
