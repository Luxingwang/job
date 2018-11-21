//
//  SDJPastDatePicker.m
//  Shuangdaojia_Technician
//
//  Created by XXX on 2017/4/26.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import "SDJPastDatePicker.h"
#import "NSDate+SDJTools.h"

@interface SDJPastDatePicker () <UIPickerViewDelegate,UIPickerViewDataSource>
/** 类型 */
@property (nonatomic, assign) PastDatePickerType type;
/** 日期数据源 年月日数组列表 @[@[年], @[月], @[日]] */
@property (nonatomic, strong) NSArray *dateSource;
/** 当前时间 */
@property (nonatomic, strong) NSDate *nowDate;
@end

@implementation SDJPastDatePicker

- (instancetype)initWithTitle:(NSString *)title type:(PastDatePickerType)type
{
    if (self = [super initWithTitle:title delegate:self]) {
        self.type = type;
    }
    return self;
}


#pragma PickerView delegate & dataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return self.dateSource.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component >= self.dateSource.count) {
        return 0;
    }
    
    // 设置年
    if (component == 0) {
        return [self.dateSource[component] count];
    }
    
    // 设置月
    NSUInteger year = [self selectedTimeForComponent:0];
    if (component == 1) {
        if (year == self.nowDate.year) {
            return self.nowDate.month;
        }
        return 12;
    }
    
    // 设置日
    NSUInteger month = [self selectedTimeForComponent:1];
    if (year == self.nowDate.year && month == self.nowDate.month) {
        return self.nowDate.day;
    }
    return [NSDate daysOfMonth:month year:year];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
    return SCREEN_WIDTH/4.0;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = (UILabel *)view;
    if (!label) {
        label = [[UILabel alloc] init];
        label.font = [UIFont systemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
    }
    if (component < self.dateSource.count && row < [self.dateSource[component] count]) {
        label.text = self.dateSource[component][row];
    }
    return label;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView reloadComponent:2];
    }
    else if (component == 1) {
        [pickerView reloadComponent:2];
    }
}


#pragma mark - Public

- (void)setSelectedDate:(NSDate *)selectedDate
{
    if (!selectedDate && self.type == PastDatePickerTypeBirthday) {
        selectedDate = [NSDate dateWithYear:1990 month:1 day:1];
    }
    else if (!selectedDate) {
        return;
    }
    [self performSelector:@selector(selectCurrentDate:) withObject:selectedDate afterDelay:PopAnimationDuration];
}

- (void)selectCurrentDate:(NSDate *)date
{
    [self.pickerView selectRow:date.year-[self.dateSource[0][0] integerValue] inComponent:0 animated:NO];
    [self.pickerView selectRow:date.month-1 inComponent:1 animated:NO];
    [self.pickerView selectRow:date.day-1 inComponent:2 animated:NO];
    [self.pickerView reloadAllComponents];
}

- (NSDate *)selectedDate
{
    NSUInteger year = [self selectedTimeForComponent:0];
    NSUInteger month = [self selectedTimeForComponent:1];
    NSUInteger day = [self selectedTimeForComponent:2];
    // 校验月份
    day = MIN(day, [NSDate daysOfMonth:month year:year]);
    // 当前选中的时间
    NSDate *date = [NSDate dateWithYear:year month:month day:day];
    // 不能选择未来的时间
    if ([date isLaterThan:[NSDate date]]) {
        date = self.nowDate;
    }
    return date;
}


#pragma mark - Helper

- (NSUInteger)selectedTimeForComponent:(NSUInteger)component
{
    if (component >= self.dateSource.count) {
        return 0;
    }
    NSArray *dateList = self.dateSource[component];
    NSUInteger row = MIN([self.pickerView selectedRowInComponent:component], dateList.count-1);
    return [dateList[row] integerValue];
}


- (NSArray *)dateSource
{
    if (!_dateSource) {
        self.nowDate = [NSDate date];
        NSMutableArray *years = [NSMutableArray array];
        NSInteger first = self.type ? 2015 : self.nowDate.year-100;
        for (NSInteger i = first; i <= self.nowDate.year; i++) {
            [years addObject:FormatString(@"%ld年", i)];
        }
        NSMutableArray *months = [NSMutableArray array];
        for (NSInteger i = 1; i <= 12; i++) {
            [months addObject:FormatString(@"%ld月", i)];
        }
        NSMutableArray *days = [NSMutableArray array];
        for (NSInteger i = 1; i <= 31; i++) {
            [days addObject:FormatString(@"%ld日", i)];
        }
        _dateSource = @[ years, months, days ];
    }
    return _dateSource;
}

@end
