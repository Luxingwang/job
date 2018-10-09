//
//  FJAccountLoginController.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJService.h"
#import "FJLoginPhoneTextField.h"
#import "FJLoginPasswordTextField.h"
#import "FJAccountLoginController.h"
#import "FJResetPasswordController.h"
@interface FJAccountLoginController ()
@property (nonatomic,strong) UIButton *protocolBtn;
@property (nonatomic,strong) UIButton *forgetPasswordBtn;
@property (nonatomic,strong) FJLoginPhoneTextField    *phoneTextField;
@property (nonatomic,strong) FJLoginPasswordTextField *passwortTextField;
@end

@implementation FJAccountLoginController

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
    [self.view addSubview:self.handleButton];
    [self.view addSubview:self.forgetPasswordBtn];
    [self.view addSubview:self.protocolBtn];
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
    [self.handleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(32);
        make.right.mas_equalTo(-32);
        make.bottom.mas_equalTo(-192);
        make.height.mas_equalTo(48);
    }];
    [self.forgetPasswordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(19);
        make.right.mas_equalTo(self.handleButton.mas_right);
        make.top.mas_equalTo(self.handleButton.mas_bottom).offset(29);
    }];
    [self.protocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-40);
        make.height.mas_equalTo(23);
        make.width.mas_lessThanOrEqualTo(220);
        make.centerX.mas_equalTo(self.view);
    }];
}

#pragma mark
-(void)didSelectForgetPassword:(UIButton*)sender
{
    FJResetPasswordController *controller = [[FJResetPasswordController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark
- (FJLoginHandleButton*)handleButton{
    if (_handleButton==nil) {
        _handleButton = [FJLoginHandleButton buttonWithHandleType:LoginHandleTypeFast];
    }
    return _handleButton;
}

-(FJLoginPhoneTextField*)phoneTextField{
    if (!_phoneTextField) {
        _phoneTextField = [[FJLoginPhoneTextField alloc] init];
    }
    return _phoneTextField;
}

-(FJLoginPasswordTextField*)passwortTextField{
    if (!_passwortTextField) {
        _passwortTextField = [[FJLoginPasswordTextField alloc] init];
        _passwortTextField.type = LoginPasswordLogin;
    }
    return _passwortTextField;
}

-(UIButton*)forgetPasswordBtn{
    if (!_forgetPasswordBtn) {
        _forgetPasswordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgetPasswordBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_forgetPasswordBtn setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetPasswordBtn  setTitleColor:[UIColor at_colorWithHex:0xFFFFFF] forState:UIControlStateNormal];
        [_forgetPasswordBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [_forgetPasswordBtn addTarget:self action:@selector(didSelectForgetPassword:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetPasswordBtn;
}

-(UIButton*)protocolBtn{
    if (!_protocolBtn) {
        _protocolBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _protocolBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        NSString *grayString  = @"登录代表你已同意";
        NSString *whiteString = @"《用户协议及隐私政策》";
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",grayString,whiteString]];
        [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11] range:NSMakeRange(0, string.length)];
        [string addAttribute:NSForegroundColorAttributeName value:[UIColor at_colorWithHex:0xFFFFFF] range:[string.string rangeOfString:whiteString]];
        [string addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:[string.string rangeOfString:grayString]];
        [_protocolBtn setAttributedTitle:string forState:UIControlStateNormal];
    }
    return _protocolBtn;
}
@end
