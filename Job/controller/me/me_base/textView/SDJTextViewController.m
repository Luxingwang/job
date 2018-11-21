//
//  SDJTextViewController.m
//  Shuangdaojia_Merchant
//
//  Created by XXX on 17/6/26.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import "SDJTextViewController.h"

@interface SDJTextViewController ()

@end

@implementation SDJTextViewController

- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder noTextTips:(NSString *)noTextTips doneHandler:(TextDoneHandler)doneHandler
{
    if (self = [super init]) {
        self.view.backgroundColor = [UIColor at_colorWithHex:0xe6e6e6];
        self.navigationItem.title = title;
//        self.navigationItem.rightBarButtonItem = [UIBarButtonItem rightItemWithTitle:@"确定" target:self action:@selector(submitAction)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(submitAction)];
        [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];
        self.doneHandler = doneHandler;
        self.textView = [[SDJTextView alloc] init];
//        self.textView.backgroundColor = self.view.backgroundColor;
        self.textView.placeholder = placeholder;
        self.textView.noTextTips = noTextTips;
        self.textView.textColor = [UIColor at_colorWithHex:0x727171];
        [self.view addSubview:self.textView];
        [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.offset(0);
            make.height.offset(160);
        }];
    }
    return self;
}

- (instancetype)initWithRemarks:(NSString *)remarks placeholder:(id)placeholder doneHandler:(TextDoneHandler)doneHandler
{
    if (self = [self initWithTitle:remarks.length ? @"修改备注" : @"添加备注" placeholder:placeholder noTextTips:remarks.length ? nil : @"请输入备注信息" doneHandler:doneHandler]) {
        self.textView.text = remarks;
    };
    return self;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.textView resignFirstResponder];
}

- (void)submitAction
{
//    if (!self.textView.isValidText) {
//        [self.view endEditing:YES];
//        return;
//    }
    if (self.doneHandler) {
        self.doneHandler(self, self.textView.text);
        [self.navigationController popViewControllerAnimated:YES];
    }
}

@end
