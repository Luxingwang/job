//
//  FJBindPhoneController.m
//  Job
//
//  Created by 于可心 on 2018/10/28.
//  Copyright © 2018 lxw. All rights reserved.
//

#import "FJBindPhoneController.h"
#import "FJUserSetupService.h"
#import "UITextField+BlocksKit.h"
#import "UIControl+BlocksKit.h"

@interface FJBindPhoneController ()
@property (nonatomic, strong) id timer;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *code;
@property (nonatomic, strong) UIButton *codeButton;
@end

@implementation FJBindPhoneController

- (instancetype)initWithPhone:(NSString *)phone
{
    if (self = [super init]) {
        self.phone = phone;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
            [button bk_addEventHandler:^(UIButton *sender) {
                if (!self.phone.length) {
                    return;
                }
                sender.enabled = NO;
                [self getCode];
                [self startTiming];
            } forControlEvents:UIControlEventTouchUpInside];
        }
        else {
            UITextField *textField = [[UITextField alloc]init];
            textField.keyboardType = UIKeyboardTypeNumberPad;
            textField.tag = idx;
            textField.placeholder = obj;
            [self.view addSubview:textField];
            [textField addSeparatorWithType:SeparatorTypeBottomFill heightOrWidth:1];
            [textField mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(30);
                make.right.offset(-30);
                make.height.mas_equalTo(50);
                make.top.offset(20 + idx * 60 );
            }];
            [textField addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventEditingChanged];
            if (idx == 0 && self.phone.length) {
                textField.text = self.phone;
                textField.enabled = NO;
            }
            //            [textField setBk_didEndEditingBlock:^(UITextField *textField) {
            //                [self setValue:textField.text forKey:idx == 0 ? @"phone" : @"code"];
            //            }];
        }
        idx++;
    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"确定" forState:UIControlStateNormal];
    button.layer.cornerRadius = 6;
    button.backgroundColor = [UIColor at_colorWithHex:0x2fa7e0];
    [self.view addSubview:button];
    [button bk_addEventHandler:^(UIButton *sender) {
        [self editPhone];
    } forControlEvents:UIControlEventTouchUpInside];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.right.offset(-30);
        make.height.mas_equalTo(48);
        make.top.equalTo(self.codeButton.mas_bottom).offset(30);
    }];
}

- (void)valueChanged:(UITextField *)textField
{
    [self setValue:textField.text forKey:textField.tag == 0 ? @"phone" : @"code"];
}

- (void)getCode
{
    [[FJUserSetupService instance]getPhoneCodeWithPhone:self.phone successBlock:^(id data) {
        
    } failureBlock:^(NSString *msg) {
        
    }];
}

- (void)editPhone
{
    if (!self.code.length) {
        return;
    }
    [[FJUserSetupService instance] editPhoneWithPhone:self.phone code:self.code successBlock:^(id data) {
        [self.navigationController popViewControllerAnimated:YES];
    } failureBlock:^(NSString *msg) {
        
    }];
}

- (void)startTiming
{
    __block NSInteger second = 60;
    //全局队列    默认优先级
    dispatch_queue_t quene = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //定时器模式  事件源
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, quene);
    
    _timer = timer;
    
    //NSEC_PER_SEC是秒，＊1是每秒
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), NSEC_PER_SEC * 1, 0);
    //设置响应dispatch源事件的block，在dispatch源指定的队列上运行
    dispatch_source_set_event_handler(timer, ^{
        //回调主线程，在主线程中操作UI
        dispatch_async(dispatch_get_main_queue(), ^{
            if (second >= 0) {
                [self.codeButton setTitle:[NSString stringWithFormat:@"还剩%ld秒", second] forState:UIControlStateNormal];
                second--;
            }
            else
            {
                //这句话必须写否则会出问题
                dispatch_source_cancel(timer);
                [self.codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
                self.codeButton.enabled = YES;
            }
        });
    });
    //启动源
    dispatch_resume(timer);
}

@end
