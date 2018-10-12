//
//  FJFastLoginController.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJService.h"
#import "UIView+Extension.h"
#import "FJFastLoginController.h"
#import "FJLoginPhoneTextField.h"
#import "FJLoginVertifyTextField.h"
#import "FJAccountLoginController.h"
@interface FJFastLoginController ()
@property (nonatomic,strong) UIButton *protocolBtn;
@property (nonatomic,strong) UIButton *accontLoginBtn;
@property (nonatomic,strong) FJLoginPhoneTextField   *phoneTextField;
@property (nonatomic,strong) FJLoginVertifyTextField *vertifyTextField;
@end

@implementation FJFastLoginController
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
    [self.view addSubview:self.vertifyTextField];
    [self.view addSubview:self.handleButton];
    [self.view addSubview:self.accontLoginBtn];
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
    [self.vertifyTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.height.mas_equalTo(self.phoneTextField);
        make.top.mas_equalTo(self.phoneTextField.mas_bottom).offset(29);
    }];
    [self.handleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(32);
        make.right.mas_equalTo(-32);
        make.bottom.mas_equalTo(-192);
        make.height.mas_equalTo(48);
    }];
    [self.accontLoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
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

-(void)fetchVertifyCode
{
    
    NSString *phone = self.phoneTextField.text;
    [[FJService instance].userService fetchFastLoginVertifyCodeAtPhoneNum:phone successBlock:^(id data) {
        
    } failureBlock:^(NSString *msg) {
        
    }];
}

-(void)fastLogin
{
    NSString *phone = self.phoneTextField.text;
    NSString *code = self.vertifyTextField.text;
    [[FJService instance].userService fastLoginVertifyCodeAtPhoneNum:phone code:code successBlock:^(id data) {
        
    } failureBlock:^(NSString *msg) {
        
    }];
}

#pragma mark
-(void)didSelectLoginByAccountPassword:(UIButton*)sender
{
    FJAccountLoginController *controller = [[FJAccountLoginController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

#pragma mark
- (FJLoginHandleButton*)handleButton{
    if (_handleButton==nil) {
        _handleButton = [FJLoginHandleButton buttonWithHandleType:LoginHandleTypeFast];
        [_handleButton addTarget:self action:@selector(fastLogin) forControlEvents:UIControlEventTouchUpInside];
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
        [_vertifyTextField.fectchVertifyCodeBtn addTarget:self action:@selector(fetchVertifyCode) forControlEvents:UIControlEventTouchUpInside];
    }
    return _vertifyTextField;
}

-(UIButton*)accontLoginBtn{
    if (!_accontLoginBtn) {
        _accontLoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _accontLoginBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_accontLoginBtn setTitle:@"密码登录" forState:UIControlStateNormal];
        [_accontLoginBtn  setTitleColor:[UIColor at_colorWithHex:0xFFFFFF] forState:UIControlStateNormal];
        [_accontLoginBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
        [_accontLoginBtn addTarget:self action:@selector(didSelectLoginByAccountPassword:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _accontLoginBtn;
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
