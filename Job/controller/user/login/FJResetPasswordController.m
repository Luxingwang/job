//
//  FJResetPasswordController.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJService.h"
#import "FJLoginPhoneTextField.h"
#import "FJLoginVertifyTextField.h"
#import "FJLoginPasswordTextField.h"
#import "FJResetPasswordController.h"

@interface FJResetPasswordController ()
@property (nonatomic,strong) FJLoginPhoneTextField    *phoneTextField;
@property (nonatomic,strong) FJLoginVertifyTextField  *vertifyTextField;
@property (nonatomic,strong) FJLoginPasswordTextField *passwortTextField;
@end

@implementation FJResetPasswordController

@synthesize handleButton=_handleButton;

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark
- (void)setUpSubviews{
    [super setUpSubviews];
    [self.view addSubview:self.phoneTextField];
    [self.view addSubview:self.passwortTextField];
    [self.view addSubview:self.vertifyTextField];
    [self.view addSubview:self.handleButton];
}

- (void)initConstraints{
    [super initConstraints];
    [self.phoneTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(32);
        make.right.mas_equalTo(-32);
        make.height.mas_equalTo(42);
        make.top.mas_equalTo(self.profileImgv.mas_bottom).offset(72);
    }];
    [self.passwortTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(self.phoneTextField);
        make.top.mas_equalTo(self.phoneTextField.mas_bottom).offset(29);
    }];
    [self.vertifyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(self.passwortTextField);
        make.top.mas_equalTo(self.passwortTextField.mas_bottom).offset(29);
    }];
    [self.handleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(32);
        make.right.mas_equalTo(-32);
        make.bottom.mas_equalTo(-192);
        make.height.mas_equalTo(48);
    }];
}

#pragma mark
- (FJLoginHandleButton*)handleButton{
    if (_handleButton==nil) {
        _handleButton = [FJLoginHandleButton buttonWithHandleType:LoginHandleTypeResetPassword];
    }
    return _handleButton;
}

-(FJLoginPhoneTextField*)phoneTextField{
    if (!_phoneTextField) {
        _phoneTextField = [[FJLoginPhoneTextField alloc] init];
    }
    return _phoneTextField;
}

-(FJLoginVertifyTextField*)vertifyTextField{
    if (!_vertifyTextField) {
        _vertifyTextField = [[FJLoginVertifyTextField alloc] init];
    }
    return _vertifyTextField;
}

-(FJLoginPasswordTextField*)passwortTextField{
    if (!_passwortTextField) {
        _passwortTextField = [[FJLoginPasswordTextField alloc] init];
        _passwortTextField.type = LoginPasswordForget;
    }
    return _passwortTextField;
}
@end
