//
//  SDJPopoverView.h
//  Shuangdaojia_Customer
//
//  Created by XXX on 16/1/14.
//  Copyright © 2016年 Daochan. All rights reserved.
//

#import <UIKit/UIKit.h>

static const float PopAnimationDuration = 0.25f;


@interface SDJPopoverView : NSObject <UIPopoverControllerDelegate>

/**
 *  工具栏高度 默认为44
 */
@property (nonatomic, assign) CGFloat toolBarHeight;

/**
 *  整体视图高度 默认为260
 */
@property (nonatomic, assign) CGFloat viewHeight;

/**
 *  中间标题
 */
@property (nonatomic, copy) NSString *title;

/**
 *  内容视图
 */
@property (nonatomic, strong) UIView *contentView;

/**
 *  是否已显示
 */
@property (nonatomic, readonly, assign, getter=isShow) BOOL show;

/**
 *  用于记录点击时的来源索引 便于刷新数据
 */
@property (nonatomic, strong) NSIndexPath *fromIndexPath;

/**
 *  确定事件
 */
@property (nonatomic, copy) VoidBlock doneBlock;

/**
 *  确定事件 新方法
 */
@property (nonatomic, copy) BOOL (^confirmBlock)(id popover);

/**
 *  取消事件
 */
@property (nonatomic, copy) VoidBlock cancelBlock;

/**
 *  消失事件
 */
@property (nonatomic, copy) VoidBlock dismissBlock;

/**
 *  显示完成事件
 */
@property (nonatomic, copy) VoidBlock showCompletionBlock;

/**
 *  显示
 */
- (void)showView;

/**
 *  隐藏
 */
- (void)hideView;

/**
 *  构造方法
 *
 *  @param title  中间标题
 *  @param height 视图高度
 */
- (instancetype)initWithTitle:(NSString *)title height:(CGFloat)height;

/**
 *  构造方法
 *
 *  @param title       中间标题
 *  @param height      视图高度
 *  @param cancelTitle 取消按钮标题 默认为"取消"
 *  @param doneTitle   确定按钮标题 默认为"确定"
 */
- (instancetype)initWithTitle:(NSString *)title height:(CGFloat)height cancelTitle:(NSString *)cancelTitle doneTitle:(NSString *)doneTitle;


@end
