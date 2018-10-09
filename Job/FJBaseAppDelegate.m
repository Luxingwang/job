//
//  FJBaseAppDelegate.m
//  Job
//
//  Created by 小黑胖 on 2018/9/5.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJAppLaunch.h"
#import "FJBaseAppDelegate.h"
@interface FJBaseAppDelegate()
@property (nonatomic,strong) FJAppLaunch *appLaunch;
@end
@implementation FJBaseAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self.appLaunch launch];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
   
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
   
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
   
}

#pragma mark
-(FJAppLaunch*)appLaunch{
    return _appLaunch?_appLaunch:[FJAppLaunch new];
}
@end
