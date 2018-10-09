//
//  FJLoginVertifyController.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "FJLoginVertifyTextField.h"
@interface FJLoginVertifyTextField ()
@property (nonatomic,strong) UIView *leftv;
@property (nonatomic,strong) UIImageView *vertifyCodeLogoImgv;
@end
@implementation FJLoginVertifyTextField
- (instancetype)init{
    self = [super init];
    if (self) {
        self.placeholder = @"验证码";
        self.leftView = self.leftv;
        self.leftViewMode = UITextFieldViewModeAlways;
        self.rightViewMode = UITextFieldViewModeAlways;
        self.rightView = self.fectchVertifyCodeBtn;
        [self.leftView addSubview:self.vertifyCodeLogoImgv];
        [self displayAttributedPlaceholder];
        [self.vertifyCodeLogoImgv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.centerY.mas_equalTo(self.leftView.mas_centerY);
        }];
    }
    return self;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    return CGRectMake(0,0,43,bounds.size.height);
}
- (CGRect)rightViewRectForBounds:(CGRect)bounds{
    return CGRectMake(bounds.size.width-80,0,80,bounds.size.height);
}
#pragma mark

-(UIView*)leftv{
    if (!_leftv) {
        _leftv = [[UIView alloc] init];
    }
    return _leftv;
}

-(UIImageView*)vertifyCodeLogoImgv{
    if (!_vertifyCodeLogoImgv) {
        _vertifyCodeLogoImgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_login_vertify_code_logo"]];
        _vertifyCodeLogoImgv.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _vertifyCodeLogoImgv;
}

-(UIButton*)fectchVertifyCodeBtn{
    if (!_fectchVertifyCodeBtn) {
        _fectchVertifyCodeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _fectchVertifyCodeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [_fectchVertifyCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_fectchVertifyCodeBtn setTitleColor:[UIColor at_colorWithHex:0xFFFFFF] forState:UIControlStateNormal];
    }
    return _fectchVertifyCodeBtn;
}
@end
