//
//  FJPasswordController.m
//  Job
//
//  Created by XXX on 2018/10/29.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJPasswordController.h"
#import "UITextField+BlocksKit.h"

@interface FJPasswordController ()

@end

@implementation FJPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"设置密码";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [@[@"设置新密码", @"请再次输入新密码"] bk_each:^(id obj) {
        NSInteger index = [obj isEqualToString:@"请再次输入新密码"];
        UITextField *textField = [[UITextField alloc]init];
        textField.placeholder = obj;
        [self.view addSubview:textField];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(10);
            make.right.offset(-10);
            make.height.mas_equalTo(40);
            make.top.offset(38 + index * 60 );
        }];
//        [textField setBk_didEndEditingBlock:^(UITextField *textField) {
//
//        }];
        [textField addSeparatorWithType:SeparatorTypeBottomFill heightOrWidth:1];
        textField.keyboardType = UIKeyboardTypeASCIICapable;
        [textField addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventEditingChanged];
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"完成" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.backgroundColor = [UIColor at_colorWithHex:0x2fa8e1];
    button.layer.cornerRadius = 6;
    [self.view addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.right.offset(-30);
        make.height.mas_equalTo(48);
        make.top.offset(170);
    }];
}

- (void)valueChanged:(UITextField *)textField
{
    
}

@end
