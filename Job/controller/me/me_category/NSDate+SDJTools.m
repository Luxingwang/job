//
//  NSDate+SDJTools.m
//  Shuangdaojia_Customer
//
//  Created by XXX on 16/4/7.
//  Copyright © 2015年 Daochan. All rights reserved.
//

#import "NSDate+SDJTools.h"
#import "NSDate+String.h"
#define HourInterval (24 * 60 * 60)

@implementation NSDate (SDJTools)

/**
 *  手动计算一年中的第几周 用于收益
 */
- (NSInteger)numberOfWeek
{
    // 计算每年第一个周一之前的天数，如果＞3天则记为第1周，如果≤3天，则算作上一年的最后1周
    // 下一年的第一周
    if (self.isBelongNextYear) {
        return 1;
    }
    NSInteger firstMonday = [NSDate getFirstMondayOfYear:self.year];
    // 上一年的最后一周
    if (firstMonday <= 3 && self.dayOfYear <= firstMonday) {
        return [NSDate getLastWeekOfYear:self.year-1];
    }
    return ceilf((self.dayOfYear-firstMonday)/7.0) + (firstMonday > 3);
}

+ (NSInteger)getFirstMondayOfYear:(NSInteger)year
{
    // @[2, 3, 4, 5, 6, 7, 1]
    // @[0, 6, 5, 4, 3, 2, 1]
    NSDate *firstDay = [NSDate dateWithYear:year month:1 day:1];
    return (9-firstDay.weekday)%7;
}

+ (NSInteger)getLastWeekOfYear:(NSInteger)year
{
    NSInteger subDays = [self getFirstMondayOfYear:year];
    NSInteger daysInYear = 365 + (year%400 == 0 || (year%100 && year%4 == 0));
    return ceilf((daysInYear-subDays)/7.0) + (subDays>3);
}

// 是否为来年第一周
- (BOOL)isBelongNextYear
{
    if (self.dayOfYear <= 365-3) {
        return NO;
    }
    // @[2, 3, 4]
    // @[0, 1, 2]
    NSDate *endDay = [NSDate dateWithYear:self.year month:12 day:31];
    NSInteger weekday = endDay.weekday;
    if (weekday >= 2 && weekday <= 4) {
        if (endDay.dayOfYear - self.dayOfYear <= (weekday-2)) {
            return YES;
        }
    }
    return NO;
}

/**
 *  星期区间 MM/dd-MM/dd
 */
- (NSString *)stringOfWeek
{
    double interval = 0;
    NSDate *beginDate = nil;
    NSDate *endDate = nil;
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    [calendar setFirstWeekday:2];
    // 获取日历单元的第一天 （星期天）
    BOOL success = [calendar rangeOfUnit:NSCalendarUnitWeekOfMonth startDate:&beginDate interval:&interval forDate:self];
    if (success) {
        // 获取 星期一
        interval -= HourInterval;
        endDate = [beginDate dateByAddingTimeInterval:interval];
    }
    else {
        return @"";
    }
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"M/d"];
    NSString *beginStr = [formatter stringFromDate:beginDate];
    NSString *endStr = [formatter stringFromDate:endDate];
    return [NSString stringWithFormat:@"%@-%@", beginStr, endStr];
}

- (NSDate *)firstDayOfMonth
{
    return [self dateBySubtractingDays:self.day-1];
}

+ (NSUInteger)daysOfMonth:(NSUInteger)month year:(NSUInteger)year
{
    //    NSCalendar *calendar = [NSCalendar currentCalendar];
    //    NSDateComponents *components = [[NSDateComponents alloc] init];
    //    [components setYear:year];
    //    [components setMonth:month];
    //
    //    NSDate *date = [calendar dateFromComponents:components];
    //    NSRange range = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date];
    //    return range.length;
    
    switch (month) {
        case 1:
        case 3:
        case 5:
        case 7:
        case 8:
        case 10:
        case 12:
            return 31;
        case 2:
            return 28 + (year%400 == 0 || (year%100 && year%4 == 0));
        default:
            return 30;
    }
}

- (NSDate *)dateForToday
{
    NSString *dateString = FormatString(@"%@ %@", [NSDate date].fullDateString, self.timeString);
    return [NSDate dateFromString:dateString format:@"yyyy-MM-dd HH:mm"];
}

@end
