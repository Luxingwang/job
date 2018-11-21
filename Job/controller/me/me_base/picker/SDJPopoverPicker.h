//
//  SDJPopoverPicker.h
//  Shuangdaojia_Customer
//
//  Created by XXX on 16/1/14.
//  Copyright © 2016年 Daochan. All rights reserved.
//

#import "SDJPopoverView.h"

@interface SDJPopoverPicker : SDJPopoverView <UIPickerViewDelegate, UIPickerViewDataSource>

/**
 *  选择视图
 */
@property (nonatomic, strong) UIPickerView *pickerView;

/**
 *  构造方法
 *
 *  @param title    中间标题
 *  @param delegate 代理
 */
- (instancetype)initWithTitle:(NSString *)title delegate:(id<UIPickerViewDelegate, UIPickerViewDataSource>)delegate;

@end
