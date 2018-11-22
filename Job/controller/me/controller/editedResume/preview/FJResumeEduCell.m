//
//  FJResumeEduCell.m
//  Job
//
//  Created by 于可心 on 2018/11/22.
//  Copyright © 2018 lxw. All rights reserved.
//

#import "FJResumeEduCell.h"

@interface FJResumeEduCell ()
@property (nonatomic, strong) UILabel *schoolLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *eduLabel;
@property (nonatomic, strong) UIImageView *iconImageView;

@end

@implementation FJResumeEduCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.schoolLabel = [[UILabel alloc]init];
        self.schoolLabel.font = [UIFont systemFontOfSize:26];
        self.schoolLabel.textColor = [UIColor at_colorWithHex:0x3E3A39];
        
        self.timeLabel = [[UILabel alloc]init];
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.textColor = [UIColor at_colorWithHex:0x727171];
        
        self.eduLabel = [[UILabel alloc] init];
        self.eduLabel.font = [UIFont systemFontOfSize:14];
        self.eduLabel.textColor = [UIColor at_colorWithHex:0x727171];
        
        self.iconImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubviews:@[self.schoolLabel, self.timeLabel, self.eduLabel, self.iconImageView]];
        
        [self.schoolLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(24);
            make.top.offset(23);
        }];
        
        [self.eduLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(24);
            make.top.equalTo(self.schoolLabel.mas_bottom).offset(10);
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-24);
            make.centerY.equalTo(self.schoolLabel);
        }];
        
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(24);
            make.bottom.offset(-24);
            make.size.mas_equalTo(CGSizeMake(100, 100));
        }];
        
    }
    return self;
}
@end
