//
//  FJJobCell.m
//  Job
//
//  Created by 小黑胖 on 2018/10/4.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJJobCell.h"
#import "UIColor+Extension.h"
#import "UIImageView+WebCache.h"
@interface FJJobCell ()
@property (nonatomic,strong) UIImageView *coverImgv;
@property (nonatomic,strong) UILabel *jobNameLabel;
@property (nonatomic,strong) UILabel *incomeLevelLabel;
@property (nonatomic,strong) UILabel *companyNameLabel;
@end
@implementation FJJobCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpCell];
        [self setUpSubviews];
        [self initConstraints];
    }
    return self;
}

-(void)setUpCell{
    self.separatorInset = UIEdgeInsetsMake(0,96,0,0);
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setUpSubviews{
    [self addSubview:self.coverImgv];
    [self addSubview:self.incomeLevelLabel];
    [self addSubview:self.jobNameLabel];
    [self addSubview:self.companyNameLabel];
}

-(void)initConstraints{
    [self.coverImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(13);
        make.width.height.mas_equalTo(68);
    }];
    [self.incomeLevelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.mas_equalTo(-13);
        make.height.mas_equalTo(43);
        make.width.mas_lessThanOrEqualTo(70);
    }];
    [self.jobNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(8);
        make.height.mas_equalTo(26);
        make.left.mas_equalTo(self.coverImgv.mas_right).offset(16);
        make.right.mas_equalTo(self.incomeLevelLabel.mas_left).offset(-16);
    }];
    [self.companyNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(23);
        make.top.mas_equalTo(self.jobNameLabel.mas_bottom);
        make.right.mas_equalTo(self.jobNameLabel.mas_right);
        make.width.mas_equalTo(self.jobNameLabel.mas_width);
    }];
}

#pragma mark
-(void)setJob:(FJJob *)job{
    if (job!=_job) {
        _job = job;
        [_coverImgv sd_setImageWithURL:[NSURL URLWithString:job.postImg]];
        //
        _jobNameLabel.text = job.postName;
        _companyNameLabel.text = job.companyName;
        _incomeLevelLabel.text = job.incomeLevel;
    }
}


#pragma mark
-(UIImageView*)coverImgv{
    if (!_coverImgv) {
        _coverImgv = [[UIImageView alloc] init];
        _coverImgv.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _coverImgv;
}
-(UILabel*)incomeLevelLabel{
    if (!_incomeLevelLabel) {
        _incomeLevelLabel = [[UILabel alloc] init];
        _incomeLevelLabel.adjustsFontSizeToFitWidth = YES;
        _incomeLevelLabel.font = [UIFont systemFontOfSize:16];
        _incomeLevelLabel.textAlignment = NSTextAlignmentRight;
        _incomeLevelLabel.textColor = [UIColor at_colorWithHex:0xEA5514];
    }
    return _incomeLevelLabel;
}

-(UILabel*)jobNameLabel{
    if (!_jobNameLabel) {
        _jobNameLabel = [[UILabel alloc] init];
        _jobNameLabel.font = [UIFont systemFontOfSize:16];
        _jobNameLabel.textColor = [UIColor at_colorWithHex:0x3E3A39];
    }
    return _jobNameLabel;
}

-(UILabel*)companyNameLabel{
    if (!_companyNameLabel) {
        _companyNameLabel = [[UILabel alloc] init];
        _companyNameLabel.font = [UIFont systemFontOfSize:14];
        _companyNameLabel.textColor = [UIColor at_colorWithHex:0x3E3A39];
    }
    return _companyNameLabel;
}

@end
