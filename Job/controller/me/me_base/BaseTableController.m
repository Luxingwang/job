//
//  BaseTableViewController.m
//  Shuangdaojia_Customer
//
//  Created by XXX on 15/8/29.
//  Copyright © 2015年 Daochan. All rights reserved.
//

#import "BaseTableController.h"
#import "BlocksKit+UIKit.h"

@implementation BaseTableController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (self.isGrouped) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    }
    else {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    }
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor at_colorWithHex:0xf3f4f3];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[TitleArrowCell class] forCellReuseIdentifier:NSStringFromClass([TitleArrowCell class])];
    [_tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:NSStringFromClass([UITableViewHeaderFooterView class])];
    
//    AdjustmentTableView(_tableView);
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.offset(0);
    }];
}

- (void)addBottomButtonWithActionBlock:(void(^)(void))actionBlock
{
    UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:confirmButton];
    confirmButton.backgroundColor = [UIColor at_colorWithHex:0x2fa8e1];
    [confirmButton setTitle:@"完成" forState:UIControlStateNormal];
    [confirmButton bk_addEventHandler:^(id sender) {
        !actionBlock ?: actionBlock();
    } forControlEvents:UIControlEventTouchUpInside];
    
    [confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.mas_equalTo(48);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}

@end
