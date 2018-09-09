//
//  FJTabBarController.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJMeController.h"
#import "FJMsgController.h"
#import "FJHomeController.h"
#import "FJOnlineController.h"
#import "FJTabBarController.h"
#import "FJBaseNavigationController.h"
@interface FJTabBarController ()

@end

@implementation FJTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark
-(void)setUpControllers{
    /*首页*/
    FJHomeController *homeController = [[FJHomeController alloc] init];
    FJBaseNavigationController *homeNav = [[FJBaseNavigationController alloc] initWithRootViewController:homeController];
    homeNav.tabBarItem.title = @"首页";
    homeNav.tabBarItem.image = [UIImage imageNamed:@"img_tab_home"];
    homeNav.tabBarItem.selectedImage=[UIImage imageNamed:@"img_tab_home"];
    /*消息*/
    FJMsgController *msgController = [[FJMsgController alloc] init];
    FJBaseNavigationController *msgNav = [[FJBaseNavigationController alloc] initWithRootViewController:msgController];
    msgNav.tabBarItem.title = @"消息";
    msgNav.tabBarItem.image = [UIImage imageNamed:@"img_bar-msg"];
    msgNav.tabBarItem.selectedImage=[UIImage imageNamed:@"img_bar-msg"];
    /*在线*/
    FJOnlineController *onlineController = [[FJOnlineController alloc] init];
    FJBaseNavigationController *onlineNav = [[FJBaseNavigationController alloc] initWithRootViewController:onlineController];
    onlineNav.tabBarItem.title = @"局长在线";
    onlineNav.tabBarItem.image = [UIImage imageNamed:@"img_tab_online"];
    onlineNav.tabBarItem.selectedImage=[UIImage imageNamed:@"img_tab_online"];
    /*我的*/
    FJMeController *meController = [[FJMeController alloc] init];
    FJBaseNavigationController *meNav = [[FJBaseNavigationController alloc] initWithRootViewController:meController];
    meNav.tabBarItem.title = @"我的";
    meNav.tabBarItem.image = [UIImage imageNamed:@"img_tab_me_c"];
    meNav.tabBarItem.selectedImage=[UIImage imageNamed:@"img_tab_me_c"];
    /**/
    self.viewControllers = @[homeNav,msgNav,onlineNav,meNav];
}

@end
