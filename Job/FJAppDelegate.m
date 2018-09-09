//
//  AppDelegate.m
//  Job
//
//  Created by 小黑胖 on 2018/9/5.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJAppDelegate.h"
#import "FJTabBarController.h"
@interface FJAppDelegate ()

@end

@implementation FJAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initTabBarController];
    return YES;
}

-(void)initTabBarController{
    FJTabBarController *controller = [[FJTabBarController alloc] init];
    self.window.rootViewController = controller;
    [self.window makeKeyAndVisible];
}
@end
