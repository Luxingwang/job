//
//  FJSettingController.m
//  Job
//
//  Created by 小黑胖 on 2018/10/4.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJSettingController.h"

@interface FJSettingController ()

@end

@implementation FJSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
