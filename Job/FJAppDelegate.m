//
//  AppDelegate.m
//  Job
//
//  Created by 小黑胖 on 2018/9/5.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJAppDelegate.h"
#import "IQKeyboardManager.h"
@interface FJAppDelegate ()

@end

@implementation FJAppDelegate{
    UICollectionView *collectionView;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [super application:application didFinishLaunchingWithOptions:launchOptions];
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    
    
    return YES;
}
@end
