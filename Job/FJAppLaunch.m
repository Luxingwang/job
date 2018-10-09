//
//  FJAppLaunch.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJService.h"
#import "FJAppLaunch.h"
#import "FJAppDelegate.h"
#import "FJTabBarController.h"
#import "FJFastLoginController.h"
#import "FJBaseNavigationController.h"
@interface FJAppLaunch()
@property (nonatomic,weak) FJAppDelegate *appDelegate;
@end
@implementation FJAppLaunch
-(void)launch{
    BOOL isLogin = [FJService instance].userLocalService.localUser.isLogin;
    if (isLogin||YES) {
        [self statMainUI];
    }else{
        [self startLoginUI];
    }
    [self.appDelegate.window makeKeyAndVisible];
}

-(void)statMainUI{
    FJTabBarController *rootController = [[FJTabBarController alloc] init];
    self.appDelegate.window.rootViewController = rootController;
}

-(void)startLoginUI{
    FJFastLoginController *loginController = [[FJFastLoginController alloc] init];
    FJBaseNavigationController *rootController = [[FJBaseNavigationController alloc] initWithRootViewController:loginController];
    rootController.navigationBar.hidden = YES;
    self.appDelegate.window.rootViewController = rootController;
}
#pragma mark
-(FJAppDelegate*)appDelegate{
    return (FJAppDelegate*)[UIApplication sharedApplication].delegate;
}
@end
