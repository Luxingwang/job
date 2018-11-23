//
//  FJEditedFooterAddView.m
//  Job
//
//  Created by XXX on 2018/10/15.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJEditedFooterAddView.h"
#import "BlocksKit+UIKit.h"
@interface FJEditedFooterAddView()
@property (nonatomic, strong) UIButton *button;
@end
@implementation FJEditedFooterAddView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:self.button];
        [self.button setTitleColor:[UIColor at_colorWithHex:0x2EA7E0] forState:UIControlStateNormal];
        [self.button bk_addEventHandler:^(id sender) {
            !self.addBlock ?: self.addBlock();
        } forControlEvents:UIControlEventTouchUpInside];
        
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.offset(0);
        }];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.bottomLine = [self addSeparatorWithType:SeparatorTypeTopFill];
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    [self.button setTitle:[NSString stringWithFormat:@"+%@", title] forState:UIControlStateNormal];
}
@end
