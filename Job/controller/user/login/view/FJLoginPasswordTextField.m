//
//  FJLoginPasswordTextField.m
//  Job
//
//  Created by 小黑胖 on 2018/10/2.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "FJLoginPasswordTextField.h"
@interface FJLoginPasswordTextField ()
@property (nonatomic,strong) UIView *leftv;
@property (nonatomic,strong) UIImageView *passwordLogoImgv;
@end
@implementation FJLoginPasswordTextField

- (instancetype)init{
    self = [super init];
    if (self) {
        self.leftView = self.leftv;
        self.leftViewMode = UITextFieldViewModeAlways;
        [self.leftView addSubview:self.passwordLogoImgv];
        [self.passwordLogoImgv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.centerY.mas_equalTo(self.leftView.mas_centerY);
        }];
    }
    return self;
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    return CGRectMake(0,0,43,bounds.size.height);
}

#pragma mark
-(void)setType:(LoginPasswordType)type{
    _type= type;
    if (type==LoginPasswordLogin)
    {
        self.placeholder = @"密码";
    }else if (type==LoginPasswordForget){
        self.placeholder = @"新密码(6-20位数字与字母组合)";
    }
    [self displayAttributedPlaceholder];
}

#pragma mark

-(UIView*)leftv{
    if (!_leftv) {
        _leftv = [[UIView alloc] init];
    }
    return _leftv;
}

-(UIImageView*)passwordLogoImgv{
    if (!_passwordLogoImgv) {
        _passwordLogoImgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_login_password_logo"]];
        _passwordLogoImgv.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _passwordLogoImgv;
}
@end
