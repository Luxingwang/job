//
//  SDJTypePicker.h
//  Shuangdaojia_Technician
//
//  Created by XXX on 2017/4/27.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import "SDJPopoverPicker.h"

@interface SDJTypePicker : SDJPopoverPicker


/**
 SDJTypePicker 构造方法

 @param title 标题
 @param typeStringSource 字符串数组源
 */
- (instancetype)initWithTitle:(NSString *)title stringSource:(NSArray *)stringSource;

/**
 字符串数组源
 */
@property (nonatomic, strong) NSArray *stringSource;

/**
 选中的字符串    外部设置会在showView动画结束后选中
 */
@property (nonatomic, strong) NSString *selectedString;

/**
 选中的类型(序列) 外部设置会在showView动画结束后选中
 */
@property (nonatomic, assign) NSUInteger selectedType;

@end
