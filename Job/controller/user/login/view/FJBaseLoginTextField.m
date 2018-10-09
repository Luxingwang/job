//
//  FJBaseLoginTextField.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJBaseLoginTextField.h"

@implementation FJBaseLoginTextField
-(instancetype)init{
    self = [super init];
    if (self) {
        [self setUpSubviews];
        [self initConstraints];
        self.font = [UIFont systemFontOfSize:15];
        self.backgroundColor = [UIColor clearColor];
        self.placeholderFont = [UIFont systemFontOfSize:17];
        self.placeholderColor = [UIColor at_colorWithHex:0xEFEFEF];
    }
    return self;
}

- (void)setUpSubviews{
    [self addSubview:self.linev];
}

- (void)initConstraints{
    [self.linev mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(1);
        make.left.right.bottom.mas_equalTo(self);
    }];
}
#pragma mark
-(UIView*)linev{
    if (!_linev) {
        _linev = [[UIView alloc] init];
        _linev.backgroundColor = [UIColor at_colorWithHex:0xFFFFFF];
    }
    return _linev;
}
@end
