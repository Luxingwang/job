//
//  FJSearchJobKeywordCategoryHeader.m
//  Job
//
//  Created by 小黑胖 on 2018/12/7.
//  Copyright © 2018 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "FJSearchJobKeywordCategoryHeader.h"
@interface FJSearchJobKeywordCategoryHeader ()
@property (nonatomic,strong) UILabel *keywordLabel;
@end

@implementation FJSearchJobKeywordCategoryHeader
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.keywordLabel];
        [self.keywordLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(self);
            make.left.mas_equalTo(18);
            make.right.mas_equalTo(-18);
        }];
    }
    return self;
}

- (void)setKeywordCategory:(FJJobSearchCategory *)keywordCategory
{
    _keywordCategory = keywordCategory;
    _keywordLabel.text = keywordCategory.describe;
}

#pragma mark
- (UILabel*)keywordLabel
{
    if (!_keywordLabel) {
        _keywordLabel = [[UILabel alloc] init];
        _keywordLabel.font = [UIFont systemFontOfSize:14];
        _keywordLabel.textColor = [UIColor at_colorWithHex:0x898989];
    }
    return _keywordLabel;
}
@end
