//
//  FJBaseNavigationController.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "UIColor+Extension.h"
#import "FJBaseNavigationController.h"

@interface FJBaseNavigationController ()

@end

@implementation FJBaseNavigationController
- (instancetype)initWithRootViewController:(UIViewController *)rootViewController {
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        self.navigationBar.translucent = NO;
        [self.navigationBar setBarTintColor:[UIColor at_colorWithHex:0x2EA7E0]];
        [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor at_colorWithHex:0xFFFFFF],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    }
    return self;
}

- (instancetype)init{
    self = [super init];
    if (self) {
        self.navigationBar.translucent = NO;
        [self.navigationBar setBarTintColor:[UIColor at_colorWithHex:0x2EA7E0]];
        [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor at_colorWithHex:0xFFFFFF],NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    }
    return self;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"img_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                     style:UIBarButtonItemStylePlain
                                                                    target:self
                                                                    action:@selector(back)];
        viewController.navigationItem.leftBarButtonItem = leftItem;
    }
    [super pushViewController:viewController animated:animated];
}

-(void)back{[self popViewControllerAnimated:YES];};

@end
