//
//  FJResumeYearContentCell.m
//  Job
//
//  Created by 于可心 on 2018/11/22.
//  Copyright © 2018 lxw. All rights reserved.
//

#import "FJResumeYearContentCell.h"

@interface FJResumeYearContentCell ()
@property (nonatomic, strong) UILabel *yearLabel;
@property (nonatomic, strong) UILabel *educationLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation FJResumeYearContentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.yearLabel = [[UILabel alloc]init];
        self.yearLabel.font = [UIFont systemFontOfSize:26];
        self.yearLabel.textColor = [UIColor at_colorWithHex:0x3E3A39];
        
        self.educationLabel = [[UILabel alloc]init];
        self.educationLabel.font = [UIFont systemFontOfSize:14];
        self.educationLabel.textColor = [UIColor at_colorWithHex:0x727171];
        
        self.contentLabel = [[UILabel alloc] init];
        self.contentLabel.font = [UIFont systemFontOfSize:14];
        self.contentLabel.textColor = [UIColor at_colorWithHex:0x727171];
        self.contentLabel.numberOfLines = 0;
        
        [self.contentView addSubviews:@[self.yearLabel, self.educationLabel, self.contentLabel]];
        
        [self.yearLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(24);
            make.top.offset(23);
        }];
        
        [self.educationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.yearLabel.mas_right).offset(20);
            make.centerY.equalTo(self.yearLabel);
        }];
        
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(24);
            make.top.equalTo(self.yearLabel.mas_bottom).offset(20);
            make.bottom.offset(-24);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
