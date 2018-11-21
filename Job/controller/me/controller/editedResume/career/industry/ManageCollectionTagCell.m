//
//  ManageCollectionTagCell.m
//  Job
//
//  Created by XXX on 2018/10/27.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "ManageCollectionTagCell.h"

@interface ManageCollectionTagCell ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation ManageCollectionTagCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.label = [[UILabel alloc]init];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont systemFontOfSize:14];
        self.label.textColor = [UIColor at_colorWithHex:0x898989];
        [self.contentView addSubview:self.label];
        
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.height.mas_equalTo(36);
        }];
        self.label.layer.borderWidth = 1;
        self.label.layer.borderColor = [UIColor at_colorWithHex:0xe3e4e4].CGColor;
    }
    return self;
}

- (void)setText:(NSString *)text
{
    _text = text;
    self.label.text = text;
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    self.contentView.backgroundColor = isSelected ? [UIColor at_colorWithHex:0xe3e4e4] : [UIColor whiteColor];
    self.label.textColor = isSelected ? [UIColor at_colorWithHex:0x898989] : [UIColor at_colorWithHex:0x898989];
}
@end
