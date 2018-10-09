//
//  FHHomeRecommendJobCell.m
//  Job
//
//  Created by 小黑胖 on 2018/10/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "FJHomeRecommendJobCell.h"
#import "UIImageView+AFNetworking.h"
@interface FJHomeRecommendJobCell ()
@property (nonatomic,strong) UILabel *jobNameLabel;
@property (nonatomic,strong) UILabel *incomeLevelLabel;
@property (nonatomic,strong) UILabel *companyNameScaleLabel;
@property (nonatomic,strong) UIImageView *coverImgv;
@end
@implementation FJHomeRecommendJobCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpSubviews];
        [self initConstraints];
    }
    return self;
}

-(void)setUpSubviews{
    [self addSubview:self.incomeLevelLabel];
    [self addSubview:self.companyNameScaleLabel];
    [self addSubview:self.jobNameLabel];
    [self addSubview:self.coverImgv];
    self.coverImgv.backgroundColor = [UIColor greenColor];
}

-(void)initConstraints{
    [self.incomeLevelLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self);
        make.height.mas_equalTo(21);
    }];
    [self.companyNameScaleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(23);
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.incomeLevelLabel.mas_top);
    }];
    [self.jobNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(27);
        make.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.companyNameScaleLabel.mas_top);
    }];
    [self.coverImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.mas_equalTo(self);
        make.bottom.mas_equalTo(self.jobNameLabel.mas_top).offset(-2);
    }];
}

-(void)setJob:(FJJob *)job
{
    if (job!=_job) {
        _job = job;
        [_coverImgv setImageWithURL:[NSURL URLWithString:job.postImg]];
        /**/
        _jobNameLabel.text = job.postName;
        _incomeLevelLabel.text = [NSString stringWithFormat:@"￥%@",job.incomeLevel];
        _companyNameScaleLabel.text = [NSString stringWithFormat:@"%@ %@",job.companyName,job.companyStage];
    }
}
#pragma mark
-(UIImageView*)coverImgv{
    if (!_coverImgv) {
        _coverImgv = [[UIImageView alloc] init];
    }
    return _coverImgv;
}

-(UILabel*)incomeLevelLabel{
    if (!_incomeLevelLabel) {
        _incomeLevelLabel = [[UILabel alloc] init];
        _incomeLevelLabel.font = [UIFont systemFontOfSize:14];
        _incomeLevelLabel.textAlignment = NSTextAlignmentCenter;
        _incomeLevelLabel.textColor = [UIColor at_colorWithHex:0xEA5514];
    }
    return _incomeLevelLabel;
}


-(UILabel*)jobNameLabel{
    if (!_jobNameLabel) {
        _jobNameLabel = [[UILabel alloc] init];
        _jobNameLabel.font = [UIFont systemFontOfSize:14];
        _jobNameLabel.textAlignment = NSTextAlignmentCenter;
        _jobNameLabel.textColor = [UIColor at_colorWithHex:0xE3A39];
    }
    return _jobNameLabel;
}

-(UILabel*)companyNameScaleLabel{
    if (!_companyNameScaleLabel) {
        _companyNameScaleLabel = [[UILabel alloc] init];
        _companyNameScaleLabel.font = [UIFont systemFontOfSize:14];
        _companyNameScaleLabel.textAlignment = NSTextAlignmentCenter;
        _companyNameScaleLabel.textColor = [UIColor at_colorWithHex:0x727171];
    }
    return _companyNameScaleLabel;
}
@end
