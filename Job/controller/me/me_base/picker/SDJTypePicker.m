//
//  SDJTypePicker.m
//  Shuangdaojia_Technician
//
//  Created by XXX on 2017/4/27.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import "SDJTypePicker.h"

@interface SDJTypePicker () <UIPickerViewDelegate, UIPickerViewDataSource>

@end

@implementation SDJTypePicker

- (instancetype)initWithTitle:(NSString *)title stringSource:(NSArray *)stringSource
{
    if (self = [super initWithTitle:title delegate:self]) {
        _stringSource = stringSource;
    }
    return self;
}

#pragma PickerView delegate & dataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.stringSource.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = (UILabel *)view;
    if (!label) {
        label = [[UILabel alloc] init];        
        label.font = [UIFont systemFontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
    }
    if (row < self.stringSource.count) {
        label.text = self.stringSource[row];
    }
    return label;
}

#pragma mark - Helper

- (void)setStringSource:(NSArray *)stringSource
{
    _stringSource = stringSource;
    [self.pickerView reloadAllComponents];
}

- (void)setSelectedString:(NSString *)selectedString
{
    NSUInteger index = [self.stringSource indexOfObject:selectedString];
    if (index != NSNotFound) {
        self.selectedType = index;
    }
}

- (NSString *)selectedString
{
    return self.stringSource[self.selectedType];
}


- (void)setSelectedType:(NSUInteger)selectedType
{
    [self performSelector:@selector(selectType:) withObject:@(selectedType) afterDelay:PopAnimationDuration];
}

- (NSUInteger)selectedType
{
    return [self.pickerView selectedRowInComponent:0];
}

- (void)selectType:(NSNumber *)type
{
    [self.pickerView selectRow:type.unsignedIntegerValue inComponent:0 animated:NO];
}

@end
