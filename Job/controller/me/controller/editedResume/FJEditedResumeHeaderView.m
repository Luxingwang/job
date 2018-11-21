//
//  FJEditedResumeHeaderView.m
//  Job
//
//  Created by XXX on 2018/10/22.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJEditedResumeHeaderView.h"

@interface FJEditedResumeHeaderView()
@property (nonatomic, strong) UILabel *label;
@end

@implementation FJEditedResumeHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.label = [[UILabel alloc]init];
        self.label.textColor = [UIColor at_colorWithHex:0x9FA0A0];
        self.label.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(10);
            make.centerY.offset(0);
        }];
        
        self.contentView.backgroundColor = [UIColor at_colorWithHex:0xf4f5f5];
    }
    return self;
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.label.text = title;
}

@end
