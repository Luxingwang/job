//
//  UIView+Extension.h
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)
/// 无标题缓冲视图
- (void)at_postLoading;
- (void)at_postLoadingWithTitle:(NSString *)title;
- (void)at_postLoadingWithTitle:(NSString *)title detail:(NSString *)detail;
- (void)at_postLoadingWithTitle:(NSString *)title contentColor:(UIColor *)contentColor;

/** 自动隐藏message 默认时间为2秒 */
- (void)at_postMessage:(NSString *)message;
- (void)at_postMessage:(NSString *)message duration:(NSTimeInterval)duration;
- (void)at_postMessageWithTitle:(NSString *)title detail:(NSString *)detail contentColor:(UIColor *)contentColor backgroundColor:(UIColor *)backgroundColor duration:(NSTimeInterval)duration;

///隐藏loading视图
- (void)at_hideLoading;
- (void)at_hideLoadingWithAfterDelay:(CGFloat)afterDelay;
@end
