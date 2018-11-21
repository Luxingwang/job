//
//  NSDate+SDJTools.h
//  Shuangdaojia_Customer
//
//  Created by XXX on 16/4/7.
//  Copyright © 2015年 Daochan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <NSDate+DateTools.h>

@interface NSDate (Earnings)

/**
 *  一年中的第几周
 */
- (NSInteger)numberOfWeek;

/**
 *  星期区间 MM/dd-MM/dd
 */
- (NSString *)stringOfWeek;

/**
 *  当前月的第一天
 */
- (NSDate *)firstDayOfMonth;


/**
 *  获取每个月的最大天数
 */
+ (NSUInteger)daysOfMonth:(NSUInteger)month year:(NSUInteger)year;


/**
 *  将时间转换为当天时间
 */
- (NSDate *)dateForToday;

@end
