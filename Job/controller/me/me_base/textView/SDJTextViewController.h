//
//  SDJTextViewController.h
//  Shuangdaojia_Merchant
//
//  Created by XXX on 17/6/26.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import "FJBaseController.h"
#import "SDJTextView.h"

@interface SDJTextViewController : FJBaseController

typedef void(^TextDoneHandler)(SDJTextViewController *textVC, NSString *text);

/**
 输入框
 */
@property (nonatomic, strong) SDJTextView *textView;

/**
 SDJTextViewController 构造方法

 @param title 标题
 @param placeholder 预设文字
 @param noTextTips  没有文本时的提示
 @param doneHandler 点击“确定”事件回调
 */
- (instancetype)initWithTitle:(NSString *)title placeholder:(NSString *)placeholder noTextTips:(NSString *)noTextTips doneHandler:(TextDoneHandler)doneHandler;

/**
 SDJTextViewController 添加备注构造方法
 
 @param remarks 原备注
 @param placeholder 预设文字
 @param doneHandler 点击“确定”事件回调
 */
- (instancetype)initWithRemarks:(NSString *)remarks placeholder:placeholder doneHandler:(TextDoneHandler)doneHandler;


/**
 点击“确定”事件回调
 return 是否doBack
 */
@property (nonatomic, copy) TextDoneHandler doneHandler;


@end
