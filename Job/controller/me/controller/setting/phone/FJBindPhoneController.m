//
//  FJBindPhoneController.m
//  Job
//
//  Created by 于可心 on 2018/10/28.
//  Copyright © 2018 lxw. All rights reserved.
//

#import "FJBindPhoneController.h"
#import "UITextField+BlocksKit.h"
#import "UIControl+BlocksKit.h"

@interface FJBindPhoneController ()
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *code;

@property (nonatomic, strong) UIButton *codeButton;

@end

@implementation FJBindPhoneController

- (instancetype)initWithPhone:(NSString *)phone
{
    if (self = [super init]) {
        self.phone= phone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = self.phone.length ? @"修改手机号" : @"绑定手机号";
    self.view.backgroundColor = [UIColor whiteColor];
    
    __block NSInteger idx = 0;
    [@[@"手机号", @"验证码", @"发送验证码"] bk_each:^(id obj) {
        if ([obj isEqualToString:@"发送验证码"]) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            self.codeButton = button;
            self.codeButton.layer.masksToBounds = YES;
            button.layer.cornerRadius = 9;
            [self.view addSubview:button];
            [button setTitle:obj forState:UIControlStateNormal];
            [button setTitleColor:[UIColor at_colorWithHex:0x2EA7E0] forState:UIControlStateNormal];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.offset(-30);
                make.height.mas_equalTo(40);
                make.top.offset(85);
            }];
            [button bk_addEventHandler:^(id sender) {
                if (!self.phone.length) {
                    return;
                }
                
                
            } forControlEvents:UIControlEventTouchUpInside];
        }
        else {
            UITextField *textField = [[UITextField alloc]init];
            textField.placeholder = obj;
            [self.view addSubview:textField];
            [textField addSeparatorWithType:SeparatorTypeBottomFill];
            [textField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(30);
                make.right.offset(-30);
                make.height.mas_equalTo(50);
                make.top.offset(20 + idx * 60 );
            }];
            [textField setBk_didEndEditingBlock:^(UITextField *textField) {
                [self setValue:textField.text forKey:idx == 0 ? @"phone" : @"code"];
            }];
        }
        idx++;
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor at_colorWithHex:0x2fa7e0];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.right.offset(-30);
        make.height.mas_equalTo(48);
        make.top.equalTo(self.codeButton.mas_bottom).offset(30);
    }];
}

@end
