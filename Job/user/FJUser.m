//
//  FJUser.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJUser.h"
#import "NSDate+String.h"

@implementation FJUserEdu

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"eduId" : @"id"};
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if (property.type.typeClass == [NSDate class] && ![oldValue isKindOfClass:[NSDate class]]) {
        if ([oldValue isEqual:[NSNull null]]) {
            return nil;
        }
        return [NSDate dateWithTimeIntervalSince1970:[oldValue doubleValue] / 1000];
    }
    return oldValue;
}

- (NSString *)beginDateString
{
    return [self.beginDate fullDateString];
}

- (NSString *)endDateString
{
    return [self.endDate fullDateString];
}
@end

@implementation FJUserWork

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"workId" : @"id"};
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if (property.type.typeClass == [NSDate class] && ![oldValue isKindOfClass:[NSDate class]]) {
        if ([oldValue isEqual:[NSNull null]]) {
            return nil;
        }
        return [NSDate dateWithTimeIntervalSince1970:[oldValue doubleValue] / 1000];
    }
    return oldValue;
}

- (NSString *)beginDateString
{
    return [self.beginDate fullDateString];
}

- (NSString *)endDateString
{
    return [self.endDate fullDateString];
}
@end

@implementation FJUserProject

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"projectId" : @"id"};
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if (property.type.typeClass == [NSDate class] && ![oldValue isKindOfClass:[NSDate class]]) {
        if ([oldValue isEqual:[NSNull null]]) {
            return nil;
        }
        return [NSDate dateWithTimeIntervalSince1970:[oldValue doubleValue] / 1000];
    }
    return oldValue;
}

- (NSString *)beginDateString
{
    return [self.beginDate fullDateString];
}

- (NSString *)endDateString
{
    return [self.endDate fullDateString];
}
@end

@implementation FJUser
- (instancetype)initWithType:(UserInitType)type
{
    if (self = [super init]) {
        // Switch 更好
        id value = @[[FJUserEdu new], [FJUserWork new], [FJUserProject new]][type];
        NSString *key = @[@"userEdu", @"userWork", @"userProject"][type];
        [self setValue:value forKey:key];
    }
    return self;
}

- (id)mj_newValueFromOldValue:(id)oldValue property:(MJProperty *)property
{
    if (property.type.typeClass == [NSDate class] && ![oldValue isKindOfClass:[NSDate class]]) {
        if ([oldValue isEqual:[NSNull null]]) {
            return nil;
        }
        return [NSDate dateWithTimeIntervalSince1970:[oldValue doubleValue] / 1000];
    }
    return oldValue;
}

+ (NSDictionary *)mj_objectClassInArray
{
    return @{@"educationList":@"FJUserEdu",
             @"companyList":@"FJUserWork",
             @"projectList":@"FJUserProject"};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"des" : @"description"};
}

- (NSString *)firstWorkTimeString
{
    return [self.firstWorkTime fullDateString];
}

- (NSString *)graduationTimeString
{
    return [self.graduationTime fullDateString];
}

@end
