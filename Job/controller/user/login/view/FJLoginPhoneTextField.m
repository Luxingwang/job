//
//  FJLoginPhoneTextField.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "UIColor+Extension.h"
#import "FJLoginPhoneTextField.h"
@interface FJLoginPhoneTextField ()
@property (nonatomic,strong) UILabel *leftLabel;
@end
@implementation FJLoginPhoneTextField
- (instancetype)init{
    self = [super init];
    if (self) {
        self.placeholder = @"手机号";
        self.leftView = self.leftLabel;
        self.leftViewMode = UITextFieldViewModeAlways;
        [self displayAttributedPlaceholder];
    }
    return self;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    return CGRectMake(0,0,43,bounds.size.height);
}

-(void)setUpSubviews{
    [super setUpSubviews];
}

-(void)initConstraints{
    [super initConstraints];
}
#pragma mark
-(UILabel*)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc] init];
        _leftLabel.text = @"+86";
        _leftLabel.font = [UIFont systemFontOfSize:15];
        _leftLabel.textColor = [UIColor at_colorWithHex:0xFFFFFF];
    }
    return _leftLabel;
}
@end
