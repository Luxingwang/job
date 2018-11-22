//
//  FJResumeWorkCell.m
//  Job
//
//  Created by 于可心 on 2018/11/22.
//  Copyright © 2018 lxw. All rights reserved.
//

#import "FJResumeWorkCell.h"

@interface FJResumeWorkCell ()
@property (nonatomic, strong) UILabel *compantyLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UILabel *careerLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation FJResumeWorkCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.careerLabel = [[UILabel alloc]init];
        self.careerLabel.font = [UIFont systemFontOfSize:26];
        self.careerLabel.textColor = [UIColor at_colorWithHex:0x3E3A39];
        
        self.timeLabel = [[UILabel alloc]init];
        self.timeLabel.font = [UIFont systemFontOfSize:14];
        self.timeLabel.textColor = [UIColor at_colorWithHex:0x727171];
        
        self.compantyLabel = [[UILabel alloc] init];
        self.compantyLabel.font = [UIFont systemFontOfSize:14];
        self.compantyLabel.textColor = [UIColor at_colorWithHex:0x727171];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.font = [UIFont systemFontOfSize:14];
        self.contentLabel.textColor = [UIColor at_colorWithHex:0x727171];
        self.contentLabel.numberOfLines = 0;
        
        [self.contentView addSubviews:@[self.careerLabel, self.timeLabel, self.compantyLabel, self.contentLabel]];
        
        [self.compantyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(24);
            make.top.offset(23);
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-24);
            make.top.equalTo(self.careerLabel.mas_bottom).offset(10);
            make.centerY.equalTo(self.compantyLabel);
        }];
        
        [self.careerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(24);
            make.top.equalTo(self.compantyLabel.mas_bottom).offset(10);
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(24);
            make.top.equalTo(self.careerLabel.mas_bottom).offset(10);
            make.bottom.offset(-24);
        }];
        
    }
    return self;
}
@end
