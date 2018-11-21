//
//  SDJTextView.h
//  Shuangdaojia_Merchant
//
//  Created by XXX on 2017/6/26.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDJTextView : UITextView

/** 
 *  提示标签
 */
@property (nonatomic, readonly, strong) UILabel *lengthTipsLabel;

/**
 占位文字
 */
@property(nonatomic, strong) NSString *placeholder;

/**
 *  最大可输入长度 默认为200
 */
@property (nonatomic, assign) NSUInteger maxTextLength;

/**
 *  没有文本时的提示
 */
@property (nonatomic, strong) NSString *noTextTips;

/**
 *  是否为有效文本 无效时会自动提示错误
 */
- (BOOL)isValidText;

/**
 *  文本输入发生变化回调
 */
@property (nonatomic, copy) void (^textEditingChangeBlock)(NSString *text);

/**
 *  开始编辑事件回调
 */
@property (nonatomic, copy) void(^didBeginEditingBlock)(SDJTextView *);

/**
 *  结束编辑事件回调
 */
@property (nonatomic, copy) void(^didEndEditingBlock)(SDJTextView *);



@end
