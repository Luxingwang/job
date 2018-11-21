//
//  SDJPastDatePicker.h
//  Shuangdaojia_Technician
//
//  Created by XXX on 2017/4/26.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import "SDJPopoverPicker.h"
/**
 *  过去的日期选择类型 
 */
typedef NS_ENUM(NSUInteger, PastDatePickerType) {
    PastDatePickerTypeBirthday,   // 生日 100年前到今天
    PastDatePickerTypeStatistics, // 统计 2015年到今天
};


@interface SDJPastDatePicker : SDJPopoverPicker

/**
 SDJPastDatePicker 构造方法

 @param title 标题
 @param type 类型
 */
- (instancetype)initWithTitle:(NSString *)title type:(PastDatePickerType)type;


/**
 选中的日期 外部设置会在showView动画结束后选中 
 */
@property (nonatomic, strong) NSDate *selectedDate;


@end
