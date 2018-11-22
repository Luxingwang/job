//
//  TitleArrowCell.m
//  Job
//
//  Created by XXX on 2018/10/15.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "TitleArrowCell.h"
#import "UIColor+Extension.h"
#import "BlocksKit+UIKit.h"

@interface TitleArrowCell ()

@end

@implementation TitleArrowCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        NSArray *array = @[self.titleLabel, self.arrow, self.detailLabel, self.iconImageView];
        [self.contentView addSubviews:array];
        
        [array bk_each:^(id obj) {
            [obj mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.offset(0);
                if (obj == self.titleLabel) {
                    make.left.offset(10);
                }
                else if(obj == self.arrow) {
                    make.right.offset(-10);
                }
                else if(obj == self.detailLabel) {
                    make.right.equalTo(self.arrow.mas_left).offset(-10);
                }
                else if(obj == self.iconImageView) {
                    make.left.equalTo(self.titleLabel);
                    make.size.mas_equalTo(CGSizeMake(59, 59));
                }
            }];
        }];
        
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.separator = [self.contentView addSeparatorWithType:SeparatorTypeTopFill];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.title = @"";
    }
    return self;
}

- (void)hiddenArraw
{
    self.arrow.hidden = YES;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
  
    self.iconImageView.hidden = title.length;
    self.titleLabel.hidden = !self.iconImageView.hidden;
    if (title.length) {
        self.titleLabel.text = title;
    }
}

- (void)setIsIconRight:(BOOL)isIconRight
{
    _isIconRight = isIconRight;
    [self.iconImageView setHidden:NO];
    [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.offset(0);
        make.right.equalTo(self.arrow.mas_left).offset(-10);
        make.size.mas_equalTo(CGSizeMake(59, 59));
    }];
}

- (FilletImageView *)iconImageView
{
    if (!_iconImageView) {
        _iconImageView = [FilletImageView roundImageView];
        _iconImageView.backgroundColor = [UIColor redColor];
    }
    return _iconImageView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor at_colorWithHex:0x3E3A39];
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel
{
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.textColor = [UIColor at_colorWithHex:0x9FA0A0];
        _detailLabel.font = [UIFont systemFontOfSize:13];
    }
    return _detailLabel;
}

- (UIImageView *)arrow
{
    if (!_arrow) {
        _arrow = [[UIImageView alloc]initWithImage: [UIImage imageNamed:@"img_arrow"]];
    }
    return _arrow;
}

- (UISwitch *)uiSwitch
{
    if (!_uiSwitch) {
        _uiSwitch = [[UISwitch alloc]init];
        [self.contentView addSubview:_uiSwitch];
        [_uiSwitch bk_addEventHandler:^(UISwitch *sender) {
            !self.switchBlock ?: self.switchBlock(sender.on);
        } forControlEvents:UIControlEventValueChanged];
        [_uiSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.right.equalTo(self.arrow.mas_left);
        }];
    }
    return _uiSwitch;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc]init];
        _textField.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_textField];
        _textField.textColor = [UIColor at_colorWithHex:0x9FA0A0];
        _textField.textAlignment = NSTextAlignmentRight;
        weakify(self)
        [_textField setBk_didEndEditingBlock:^(UITextField *textField) {
            strongify(self)
            !self.textFieldBlock ?: self.textFieldBlock(textField.text);
        }];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.right.equalTo(self.arrow.mas_left).offset(-10);
        }];
    }
    return _textField;
}

@end
