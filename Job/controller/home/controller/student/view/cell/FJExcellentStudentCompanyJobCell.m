//
//  FJExcellentStudentCompanyJobCell.m
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "UIImageView+WebCache.h"
#import "FJExcellentStudentCompanyJobCell.h"

@interface FJExcellentStudentCompanyJobCell()
@property (nonatomic,strong) UILabel *postCountLabel;
@property (nonatomic,strong) UILabel *scaleStageLabel;
@property (nonatomic,strong) UILabel *companyNameLabel;
@property (nonatomic,strong) UIImageView *coverImgv;
@end

@implementation FJExcellentStudentCompanyJobCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpSubviews];
        [self initConstraints];
    }
    return self;
}

-(void)setUpSubviews{
    [self addSubview:self.coverImgv];
    [self addSubview:self.postCountLabel];
    [self addSubview:self.scaleStageLabel];
    [self addSubview:self.companyNameLabel];
}

-(void)initConstraints{
    [self.coverImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(14);
        make.centerX.mas_equalTo(self);
        make.width.height.mas_equalTo(self.mas_width).multipliedBy(68/162.0);
        
    }];
    self.coverImgv.backgroundColor = [UIColor redColor];
    
    [self.postCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.height.mas_equalTo(37);
    }];
    
    [self.scaleStageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(22);
        make.bottom.mas_equalTo(self.postCountLabel.mas_top).offset(-3);
    }];
    
    [self.companyNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(25);
        make.bottom.mas_equalTo(self.scaleStageLabel.mas_top);
    }];
}

-(void)setCompanyJob:(FJExcellentStudentCompanyJob *)companyJob
{
    if (companyJob!=_companyJob) {
        _companyJob = companyJob;
        [_coverImgv sd_setImageWithURL:[NSURL URLWithString:companyJob.companyLogoUrl]];
        //
        _companyNameLabel.text = companyJob.name;
        _scaleStageLabel.text = [NSString stringWithFormat:@"%@·%@",companyJob.scale,companyJob.stage];
        NSString *postCount = [NSString stringWithFormat:@"%@",companyJob.postCount];
        NSMutableAttributedString *postCountAttributedString = [[NSMutableAttributedString alloc] initWithString:
                                                                [NSString stringWithFormat:@"%@个职位",postCount]];
        UIFont *font = [UIFont systemFontOfSize:14];
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;
        [postCountAttributedString addAttributes:@{NSFontAttributeName:font,
                                                   NSParagraphStyleAttributeName:style,
                                                   NSForegroundColorAttributeName:[UIColor at_colorWithHex:0x3E3A39]
                                                   
                                                   } range:NSMakeRange(0, postCountAttributedString.length)];
        [postCountAttributedString addAttributes:@{NSForegroundColorAttributeName:[UIColor at_colorWithHex:0x2EA7E0]} range:[postCountAttributedString.string rangeOfString:postCount]];
        _postCountLabel.attributedText =postCountAttributedString;
    }
}
#pragma mark
-(UIImageView*)coverImgv{
    if (!_coverImgv) {
        _coverImgv = [[UIImageView alloc] init];
    }
    return _coverImgv;
}

-(UILabel*)postCountLabel{
    if (!_postCountLabel) {
        _postCountLabel = [[UILabel alloc] init];
    }
    return _postCountLabel;
}
-(UILabel*)scaleStageLabel{
    if (!_scaleStageLabel) {
        _scaleStageLabel = [[UILabel alloc] init];
        _scaleStageLabel.font = [UIFont systemFontOfSize:11];
        _scaleStageLabel.textAlignment = NSTextAlignmentCenter;
        _scaleStageLabel.textColor = [UIColor at_colorWithHex:0x3E3A39];
    }
    return _scaleStageLabel;
}
-(UILabel*)companyNameLabel{
    if (!_companyNameLabel) {
        _companyNameLabel = [[UILabel alloc] init];
        _companyNameLabel.font = [UIFont systemFontOfSize:16];
        _companyNameLabel.textAlignment = NSTextAlignmentCenter;
        _companyNameLabel.textColor = [UIColor at_colorWithHex:0x3E3A39];
    }
    return _companyNameLabel;
}
@end
