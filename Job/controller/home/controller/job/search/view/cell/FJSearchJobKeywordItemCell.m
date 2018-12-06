//
//  FJSearchJobKeywordItemCell.m
//  Job
//
//  Created by 小黑胖 on 2018/12/7.
//  Copyright © 2018 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "FJSearchJobKeywordItemCell.h"
@interface FJSearchJobKeywordItemCell()
@property (nonatomic,strong) UILabel *keywordLabel;
@end

@implementation FJSearchJobKeywordItemCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.keywordLabel];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4;
        [self.keywordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        self.backgroundColor = [UIColor at_colorWithHex:0x9FA0A0];
    }
    return self;
}

- (void)setSearchItem:(FJJobSearchItem *)searchItem
{
    _searchItem = searchItem;
    _keywordLabel.attributedText = searchItem.attributedDescription;
}

#pragma mark
- (UILabel*)keywordLabel
{
    if (!_keywordLabel) {
        _keywordLabel = [[UILabel alloc] init];
    }
    return _keywordLabel;
}
@end
