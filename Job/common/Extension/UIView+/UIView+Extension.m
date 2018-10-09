//
//  UIView+Extension.m
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <objc/runtime.h>
#import "UIView+Extension.h"
#import <MBProgressHUD/MBProgressHUD.h>

static const CGFloat KTipLoadingOverTime = 60;
static const CGFloat KTipNormalOverTime = 2;

@interface UIView (ATLoadingView) <MBProgressHUDDelegate>

@property (nonatomic,strong) MBProgressHUD * progressHud;

@end

@implementation UIView (ATLoadingView)

- (MBProgressHUD *)progressHud {
    return objc_getAssociatedObject(self, _cmd);
}

- (void)setProgressHud:(MBProgressHUD *)progressHud {
    return objc_setAssociatedObject(self, @selector(progressHud), progressHud, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

@implementation UIView (Extension)

- (void)at_postLoading
{
    [self at_postLoadingWithTitle:nil];
}

- (void)at_postLoadingWithTitle:(NSString *)title {
    [self at_postLoadingWithTitle:title detail:nil];
}

- (void)at_postLoadingWithTitle:(NSString *)title contentColor:(UIColor *)contentColor {
    [self at_postLoadingWithTitle:title detail:nil];
    //    self.progressHud.contentColor = contentColor;
    self.progressHud.detailsLabelColor = contentColor;
}

- (void)at_postLoadingWithTitle:(NSString *)title detail:(NSString *)detail {
    [self at_checkCreateHudLoading];
    
    if (title.length) {
        self.progressHud.labelText = title;
        //        self.progressHud.label.text = title;
    }
    if (detail.length) {
        //        self.progressHud.detailsLabel.text = detail;
        self.progressHud.detailsLabelText = detail;
    }
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(overTimerCallback) object:nil];
    [self performSelector:@selector(overTimerCallback) withObject:nil afterDelay:KTipLoadingOverTime];
}


#pragma mark - postMessage

- (void)at_postMessage:(NSString *)message {
    [self at_postMessage:message duration:KTipNormalOverTime];
}

- (void)at_postMessage:(NSString *)message duration:(NSTimeInterval)duration{
    [self at_checkCreateHudLoading];
    [self at_setTitle:message];
    // Set the text mode to show only text.
    self.progressHud.mode = MBProgressHUDModeText;
    // Move to bottm center.
    //    self.progressHud.offset = CGPointMake(0.f, MBProgressMaxOffset);
    
    [self at_hideLoadingWithAfterDelay:duration];
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(overTimerCallback) object:nil];
    [self performSelector:@selector(overTimerCallback) withObject:nil afterDelay:duration];
}

- (void)at_postMessageWithTitle:(NSString *)title detail:(NSString *)detail contentColor:(UIColor *)contentColor backgroundColor:(UIColor *)backgroundColor duration:(NSTimeInterval)duration {
    [self at_checkCreateHudLoading];
    self.progressHud.mode = MBProgressHUDModeText;
    
    if (title.length) {
        //        self.progressHud.label.text = title;
        self.progressHud.labelText = title;
    }
    if (detail.length) {
        //        self.progressHud.detailsLabel.text = detail;
        self.progressHud.detailsLabelText = detail;
    }
    if (contentColor) {
        //        self.progressHud.contentColor = contentColor;
        self.progressHud.detailsLabelColor = contentColor;
    }
    if (backgroundColor) {
        //        self.progressHud.label.superview.backgroundColor = backgroundColor;
        self.progressHud.backgroundColor = backgroundColor;
    }
    [self at_hideLoadingWithAfterDelay:duration];
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(overTimerCallback) object:nil];
    [self performSelector:@selector(overTimerCallback) withObject:nil afterDelay:duration];
}

- (void)at_hideLoading {
    if (self.progressHud) {
        //        [self.progressHud hideAnimated:YES];
        [self.progressHud hide:YES];
        [self.progressHud removeFromSuperview];
        self.progressHud.delegate = nil;
        self.progressHud = nil;
    }
}

- (void)at_hideLoadingWithAfterDelay:(CGFloat)afterDelay {
    if (self.progressHud) {
        //        [self.progressHud hideAnimated:YES afterDelay:afterDelay];
        [self.progressHud hide:YES afterDelay:afterDelay];
    }
}

#pragma mark - private method

- (void)at_checkCreateHudLoading
{
    if (!self.progressHud) {
        self.progressHud = [MBProgressHUD showHUDAddedTo:self animated:YES];
        //        self.progressHud.bezelView.color = [UIColor blackColor];
        //        self.progressHud.contentColor = [UIColor whiteColor];
        self.progressHud.detailsLabelColor = [UIColor whiteColor];
        self.progressHud.delegate = self;
    }
}

- (void)at_setTitle:(NSString *)title {
    if ([title isKindOfClass:[NSNull class]]) {
        return;
    }
    if (title.length) {
        //        self.progressHud.label.text = title;
        self.progressHud.labelText = title;
    }
}

- (void)overTimerCallback{
    [self at_hideLoading];
}

#pragma mark - MBProgressHUDDelegate

- (void)hudWasHidden:(MBProgressHUD *)hud {
    if (self.progressHud) {
        [self.progressHud removeFromSuperview];
        self.progressHud.delegate = nil;
        self.progressHud = nil;
    }
}

@end
