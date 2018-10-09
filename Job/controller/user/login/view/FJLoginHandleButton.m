//
//  FJLoginHandleButton.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "UIColor+Extension.h"
#import "FJLoginHandleButton.h"
@implementation FJLoginHandleButton
+ (instancetype)buttonWithHandleType:(LoginHandleType)type{
    FJLoginHandleButton *handleButton = [FJLoginHandleButton buttonWithType:UIButtonTypeCustom];
    handleButton.handleHandleType = type;
    handleButton.backgroundColor = [UIColor whiteColor];
    handleButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [handleButton setTitleColor:[UIColor at_colorWithHex:0x2EA7E0] forState:UIControlStateNormal];
    return handleButton;
}

-(void)setHandleHandleType:(LoginHandleType)handleHandleType{
    _handleHandleType = handleHandleType;
    if (handleHandleType==LoginHandleTypeFast) {
        [self setTitle:@"登录" forState:UIControlStateNormal];
    }else if (handleHandleType==LoginHandleTypeAccount)
    {
        [self setTitle:@"登录" forState:UIControlStateNormal];
    }else if (handleHandleType==LoginHandleTypeResetPassword)
    {
        [self setTitle:@"确定重置密码" forState:UIControlStateNormal];
    }
}
@end
