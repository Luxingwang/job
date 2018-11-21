//
//  NSDate+String.m
//  Shuangdaojia_Technician
//
//  Created by XXX on 2016/11/8.
//  Copyright © 2016年 Daochan. All rights reserved.
//

#import "NSDate+String.h"
#import <NSDate+DateTools.h>

@implementation NSDate (String)

// 核心方法
- (NSString *)stringWithDateFormat:(NSString *)format
{
//    id value = objc_getAssociatedObject(self, &format);
//    if (!value || ![value isKindOfClass:[NSString class]] || [value length] != format.length) {
//        value = [self formattedDateWithFormat:format];
//        objc_setAssociatedObject(self, &format, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//    }
    return [self formattedDateWithFormat:format];
}

- (NSString *)timeString
{
    return [self stringWithDateFormat:@"HH:mm"];
}

- (NSString *)fullTimeString
{
    return [self stringWithDateFormat:@"HH:mm:ss"];
}

- (NSString *)dateString
{
    return [self stringWithDateFormat:@"MM-dd"];
}

- (NSString *)fullDateString
{
    return [self stringWithDateFormat:@"yyyy-MM-dd"];
}

- (NSString *)dateAndTimeString
{
    return [self stringWithDateFormat:@"MM-dd HH:mm"];
}

- (NSString *)fullDateAndTimeString
{
    return [self stringWithDateFormat:@"yyyy-MM-dd HH:mm"];
}

- (NSString *)fullDateAndFullTimeString
{
    return [self stringWithDateFormat:@"yyyy-MM-dd HH:mm:ss"];
}

- (NSString *)dayString
{
    if (self.year != [NSDate date].year) {
        return self.fullDateString;
    }
    NSArray *days = @[@"前天", @"昨天", @"今天", @"明天", @"后天"];
    for (int i = -2; i <= 2 ; i++) {
        if ([self isSameDayAsOtherDate:[NSDate dateWithTimeIntervalSinceNow:60*60*24*i]]) {
            return days[i+2];
        }
    }
    return [self dateString];
}

- (NSString *)dayAndTimeString
{
    return [NSString stringWithFormat:@"%@ %@", [self dayString], [self timeString]];
}

- (NSString *)dayAndFullTimeString
{
    return [NSString stringWithFormat:@"%@ %@", [self dayString], [self fullTimeString]];
}

- (NSString *)weekdayString
{
    return @[@"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六"][self.weekday-1];
}

- (NSString *)chartDayString
{
    NSArray *days = @[@"前天", @"昨天", @"今天"];
    for (int i = -2; i <= 0; i++) {
        if ([self isSameDayAsOtherDate:[NSDate dateWithTimeIntervalSinceNow:60*60*24*i]]) {
            return days[i+2];
        }
    }
    return [self dateString];
}

#pragma mark - Helper

- (BOOL)isSameDayAsOtherDate:(NSDate *)date
{
    NSDate *newDate = [[self class] normalizeDate:date];
    return [[[self class] normalizeDate:self] isEqualToDate:newDate];
}

- (BOOL)isSameMonthAsOtherDate:(NSDate *)date
{
    NSDate *newDate = [[self class] monthDate:date];
    return [[[self class] monthDate:self] isEqualToDate:newDate];
}

+ (NSDate *)normalizeDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday)
                                                   fromDate:date];
    NSDate* returnDate = [calendar dateFromComponents:dateComponents];
    return returnDate;
}

+ (NSDate *)monthDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *dateComponents = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth)
                                                   fromDate:date];
    NSDate* returnDate = [calendar dateFromComponents:dateComponents];
    return returnDate;
}

+ (NSDate *)dateFromString:(NSString *)dateString format:(NSString *)format
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    [dateFormatter setLocale:[NSLocale currentLocale]];
    return [dateFormatter dateFromString:dateString];
}

@end
