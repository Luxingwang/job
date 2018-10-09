//
//  ViewController.m
//  Job
//
//  Created by 小黑胖 on 2018/9/5.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "UIColor+Extension.h"
#import "FJBaseController.h"

@interface FJBaseController ()

@end

@implementation FJBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.extendedLayoutIncludesOpaqueBars = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeTop;
    self.view.backgroundColor = [UIColor at_colorWithHex:0xC9C9CA];
    if (@available(iOS 11.0, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (DEBUG) {
        NSLog(@"%@",[NSString stringWithFormat:@"msg:enter %@",NSStringFromClass([self class])]);
    }
}

-(void)dealloc{
    if (DEBUG) {
        NSLog(@"%@",[NSString stringWithFormat:@"msg:%@ dealloc",NSStringFromClass([self class])]);
    }
}

- (void)setUpSubviews{
    
};

- (void)initConstraints{
    
};

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
