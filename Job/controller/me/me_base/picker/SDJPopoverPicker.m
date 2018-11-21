//
//  SDJPopoverPicker.m
//  Shuangdaojia_Customer
//
//  Created by XXX on 16/1/14.
//  Copyright © 2016年 Daochan. All rights reserved.
//

#import "SDJPopoverPicker.h"

@implementation SDJPopoverPicker

- (instancetype)initWithTitle:(NSString *)title delegate:(id<UIPickerViewDelegate, UIPickerViewDataSource>)delegate
{
    if (self = [super initWithTitle:title height:260 cancelTitle:@"取消" doneTitle:@"选择"]) {
        self.pickerView.delegate = delegate?delegate:self;
        self.pickerView.dataSource = delegate?delegate:self;
    }
    return self;
}

- (void)dealloc
{
    self.pickerView.delegate = nil;
    self.pickerView.dataSource = nil;
}

- (UIPickerView *)pickerView
{
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc] init];
        _pickerView.showsSelectionIndicator = YES;
        _pickerView.frame = self.contentView.bounds;
        [self.contentView addSubview:_pickerView];
    }
    return _pickerView;
}

- (NSInteger)numberOfComponentsInPickerView:(nonnull UIPickerView *)pickerView
{
    return 0;
}

- (NSInteger)pickerView:(nonnull UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 0;
}

@end

