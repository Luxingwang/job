//
//  SDJTextView.m
//  Shuangdaojia_Merchant
//
//  Created by XXX on 2017/6/26.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import "SDJTextView.h"
//#import "NSString+Check.h"

@interface SDJTextView () <UITextViewDelegate>

@property (nonatomic, strong) UIColor *placeholderColor;
@property (nonatomic, strong) UIColor *realTextColor;
/** 是否空文本 */
@property (nonatomic, assign) BOOL isEmptyText;
/** 提示标签 */
@property (nonatomic, readwrite, strong) UILabel *lengthTipsLabel;
@end

@implementation SDJTextView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    self.font = [UIFont systemFontOfSize:15];
    self.delegate = self;
    self.isEmptyText = YES;
//    self.showsVerticalScrollIndicator = NO;
    self.maxTextLength = 200;
    self.textColor = [UIColor whiteColor];
    self.placeholderColor = [UIColor lightGrayColor];
}

- (void)setTextColor:(UIColor *)textColor
{
    [super setTextColor:textColor];
    self.realTextColor = textColor;
}

- (void)setText:(NSString *)text
{
    if (!text.length && !self.isFirstResponder) {
        super.text = self.placeholder;
        super.textColor = self.placeholderColor;
    }
    else {
        super.text = text;
        super.textColor = self.realTextColor;
    }
    self.isEmptyText = !text.length;
    [self updateMaxLengthTips];
}

- (NSString *)text
{
    return self.isEmptyText ? @"" : [super text];
}


- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholder = placeholder;
    if (self.isEmptyText && !self.isFirstResponder) {
        super.text = placeholder;
        super.textColor = self.placeholderColor;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (self.superview && self.frame.size.height) {
        [self.superview addSubview:self.lengthTipsLabel];
        [self.lengthTipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_bottom);
            make.right.offset(-10);
            make.height.offset(30);
        }];
    }
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (!text.length) {
        return YES;
    }
//    if ([text isEmoji]) {
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            [HUDManager showTips:@"暂不支持输入表情"];
//        });
//        return NO;
//    }
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView
{
    super.textColor = self.realTextColor;
    if (self.isEmptyText) {
        super.text = nil;
    }
    if (self.didBeginEditingBlock) {
        self.didBeginEditingBlock(self);
    }
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    if (self.isEmptyText) {
        super.textColor = self.placeholderColor;
        super.text = self.placeholder;
    }
    if (self.didEndEditingBlock) {
        self.didEndEditingBlock(self);
    }
}

- (void)textViewDidChange:(UITextView *)textView
{
//    if ([super.text containsEmoji]) {
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            [HUDManager showTips:@"暂不支持输入表情"];
//        });
//        super.text = [super.text deleteEmoji];
//    }
    self.isEmptyText = !super.text.length;
    [self updateMaxLengthTips];

    if (self.textEditingChangeBlock) {
        self.textEditingChangeBlock(textView.text);
    }
}

- (void)updateMaxLengthTips
{
    NSInteger textLength = self.maxTextLength-(self.isEmptyText?0:super.text.length);
    if (textLength >= 0) {
        self.lengthTipsLabel.textColor = [UIColor lightGrayColor];
        self.lengthTipsLabel.text = [NSString stringWithFormat:@"*还可输入%ld字", textLength];
    }
    else {
//        self.lengthTipsLabel.textColor = [UIColor backRedColor];
        self.lengthTipsLabel.text = [NSString stringWithFormat:@"*已超出%ld字", -textLength];
    }
}

/**
 *  是否为有效文本长度 无效时会自动提示错误
 */
- (BOOL)isValidText
{
    if (self.isEmptyText && self.noTextTips.length) {
//        [HUDManager showError:self.noTextTips];
        return NO;
    }
    if (!self.isEmptyText && super.text.length > self.maxTextLength) {
//        [HUDManager showError:[NSString stringWithFormat:@"不能超过%ld字哦", (long)self.maxTextLength]];
        return NO;
    }
    return YES;
}

- (void)setMaxTextLength:(NSUInteger)maxTextLength
{
    _maxTextLength = maxTextLength;
    [self updateMaxLengthTips];
}

- (UILabel *)lengthTipsLabel
{
    if (!_lengthTipsLabel) {
//        _lengthTipsLabel = [UILabel labelWithFontSize:12 textColor:[UIColor lightGrayColor] text:[NSString stringWithFormat:@"*还可输入%ld字", self.maxTextLength]];
    }
    return _lengthTipsLabel;
}

@end
