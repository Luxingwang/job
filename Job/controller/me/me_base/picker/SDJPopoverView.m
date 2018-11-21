//
//  SDJPopoverView.h
//  Shuangdaojia_Customer
//
//  Created by XXX on 16/1/14.
//  Copyright © 2016年 Daochan. All rights reserved.
//

#import "SDJPopoverView.h"
#import "SWActionSheet.h"
#import "UIImage+Color.h"

#define HUDIgnoreTag (1 << 10)

@interface SDJPopoverView ()
/** 确定按钮 */
@property (nonatomic, strong) UIBarButtonItem *doneButtonItem;
/** 取消按钮 */
@property (nonatomic, strong) UIBarButtonItem *cancelButtonItem;
/** 标题 */
@property (nonatomic, strong) UIBarButtonItem *titleButtonItem;
/** 工具栏 */
@property (nonatomic, strong) UIToolbar* toolbar;
/** 上拉视图 */
@property (nonatomic, strong) SWActionSheet *actionSheet;
@end

@implementation SDJPopoverView

#pragma mark - init

- (instancetype)init
{
    if (self = [super init]) {
        self.viewHeight = 260;
        self.toolBarHeight = 44;
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title height:(CGFloat)height
{
    if (self = [self init]) {
        self.title = title;
        if (height > 0) {
            self.viewHeight = height;
        }
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title height:(CGFloat)height cancelTitle:(NSString *)cancelTitle doneTitle:(NSString *)doneTitle
{
    if (self = [self initWithTitle:title height:height]) {
        if (cancelTitle.length) {
            self.cancelButtonItem.title = cancelTitle;
        }
        if (doneTitle.length) {
            self.doneButtonItem.title = doneTitle;
        }
    }
    return self;
}


#pragma mark - Action

// 显示
- (void)showView
{
    if (self.isShow) {
        return;
    }
    _show = YES;
    UIView *masterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.viewHeight)];
    [masterView addSubview:self.toolbar];
    [masterView addSubview:self.contentView];
    [self presentViewForView:masterView];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(PopAnimationDuration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        !self.showCompletionBlock ? : self.showCompletionBlock();
    });
}


// 隐藏
- (void)hideView
{
    [self dismissAction];
}
// 确定
- (void)doneAction
{
    if (self.confirmBlock) {
        if (self.confirmBlock(self)) {
            [self hideView];
        }
        return;
    }
    
    if (self.doneBlock) {
        self.doneBlock();
        return;
    }
    [self hideView];
}

// 取消
- (void)cancelAction
{
    if (self.cancelBlock) {
        self.cancelBlock();
    }
    [self hideView];
}

// 消失
- (void)dismissAction
{
    if (self.actionSheet) {
        self.actionSheet.window.tag = HUDIgnoreTag;
        [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    }
    self.actionSheet = nil;
    _show = NO;
    if (self.dismissBlock) {
        self.dismissBlock();
    }
}

#pragma mark - Helper

- (void)setTitle:(NSString *)title
{
    _title = title;
    [(UIButton *)self.titleButtonItem.customView setTitle:title forState:UIControlStateNormal];
}

#pragma mark - Popovers and ActionSheets

- (void)presentViewForView:(UIView *)aView
{
    _actionSheet = [[SWActionSheet alloc] initWithView:aView];
    _actionSheet.viewHeight = self.viewHeight;
//    @weakify(self);
    [_actionSheet setTouchesBeganBlock:^{
//        @strongify(self);
        [self cancelAction];
    }];
    [_actionSheet showInContainerView];

    [UIView beginAnimations:nil context:nil];
    [UIView commitAnimations];
}

#pragma mark - Lazy Load

- (UIToolbar *)toolbar
{
    if (!_toolbar) {
        _toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, _toolBarHeight)];
        _toolbar.barStyle = UIBarStyleBlackTranslucent;
        _toolbar.tintColor = [UIColor at_colorWithHex:0x9FA0A0];
        [_toolbar setBackgroundImage:[UIImage imageWithColor:[UIColor whiteColor]] forToolbarPosition:UIBarPositionAny barMetrics:0];
        
        NSMutableArray *barItems = [[NSMutableArray alloc] init];
        [barItems addObject:self.cancelButtonItem];
        UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        [barItems addObject:flexSpace];
        [barItems addObject:self.titleButtonItem];
        [barItems addObject:flexSpace];
        [barItems addObject:self.doneButtonItem];
        [_toolbar setItems:barItems animated:NO];
    }
    return _toolbar;
}

- (UIView *)contentView
{
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, _toolBarHeight, SCREEN_WIDTH, _viewHeight-_toolBarHeight)];
        _contentView.backgroundColor = [UIColor whiteColor];
    }
    return _contentView;
}

- (UIBarButtonItem *)doneButtonItem
{
    if (!_doneButtonItem) {
        _doneButtonItem = [self barButtonItemWithTitle:@"确定" action:@selector(doneAction)];
    }
    return _doneButtonItem;
}

- (UIBarButtonItem *)cancelButtonItem
{
    if (!_cancelButtonItem) {
        _cancelButtonItem = [self barButtonItemWithTitle:@"取消" action:@selector(cancelAction)];
    }
    return _cancelButtonItem;
}

- (UIBarButtonItem *)titleButtonItem
{
    if (!_titleButtonItem) {
//        UIButton *titleButton = [UIButton buttonWithTarget:nil action:nil title:self.title font:17 color:[UIColor whiteColor]];
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        titleButton.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        titleButton.frame = CGRectMake(0, 0, 170, _toolBarHeight);
        _titleButtonItem = [[UIBarButtonItem alloc] initWithCustomView:titleButton];
    }
    return _titleButtonItem;
}

- (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title action:(SEL)buttonAction
{
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self action:buttonAction];
    [barButton setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:17]} forState:UIControlStateNormal];
    return barButton;
}

@end

