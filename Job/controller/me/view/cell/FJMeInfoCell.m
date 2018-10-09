//
//  FJMeInfoCell.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJMeInfoCell.h"
#import "UIColor+Extension.h"
@interface FJMeInfoCell()
@property (nonatomic,strong) UIImageView *profileImgv;
@property (nonatomic,strong) UILabel *userNameLabel;
@property (nonatomic,strong) UILabel *editResumeLabel;
@property (nonatomic,strong) UIImageView *editResumeArrowImgv;
@property (nonatomic,strong) UILabel *deliveredLabel;
@property (nonatomic,strong) UILabel *exchangedLabel;
@property (nonatomic,strong) UILabel *terviewedLabel;
@property (nonatomic,strong) UIView  *dividedLinev1;
@property (nonatomic,strong) UIView  *dividedLinev2;
@end
@implementation FJMeInfoCell
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
    self.backgroundColor = [UIColor greenColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setUpSubviews{
    [self addSubview:self.profileImgv];
    [self addSubview:self.userNameLabel];
    [self addSubview:self.editResumeLabel];
    [self addSubview:self.editResumeArrowImgv];
    [self addSubview:self.deliveredLabel];
    [self addSubview:self.dividedLinev1];
    [self addSubview:self.exchangedLabel];
    [self addSubview:self.dividedLinev2];
    [self addSubview:self.terviewedLabel];
}

-(void)initConstraints{
    [self.profileImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(45);
        make.left.mas_equalTo(18);
        make.size.mas_equalTo(CGSizeMake(64,64));
    }];
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(51);
        make.right.mas_equalTo(-30);
        make.height.mas_equalTo(34);
        make.left.mas_equalTo(self.profileImgv.mas_right).offset(30);
    }];
    self.userNameLabel.text = @"姓名";
    [self.editResumeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(24);
        make.left.mas_equalTo(self.userNameLabel);
        make.top.mas_equalTo(self.userNameLabel.mas_bottom);
        make.width.mas_greaterThanOrEqualTo(121);
    }];
    [self.editResumeArrowImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.editResumeLabel.mas_centerY);
        make.left.mas_equalTo(self.editResumeLabel.mas_right).offset(11);
    }];
    //
    [self.deliveredLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.bottom.mas_equalTo(0);
        make.height.mas_equalTo(74);
        make.width.mas_equalTo(self.mas_width).dividedBy(3.0).offset(-2/3.0);
    }];
    self.deliveredLabel.backgroundColor = [UIColor redColor];
    [self.dividedLinev1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(36);
        make.width.mas_equalTo(1);
        make.left.mas_equalTo(self.deliveredLabel.mas_right);
        make.centerY.mas_equalTo(self.deliveredLabel.mas_centerY);
    }];
    //
    [self.exchangedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dividedLinev1.mas_right);
        make.bottom.width.height.mas_equalTo(self.deliveredLabel);
    }];
    self.exchangedLabel.backgroundColor = [UIColor redColor];
    [self.dividedLinev2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.exchangedLabel.mas_right);
        make.width.height.centerY.mas_equalTo(self.dividedLinev1);
    }];
    //
    [self.terviewedLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.dividedLinev2.mas_right);
        make.bottom.width.height.mas_equalTo(self.exchangedLabel);
    }];
    self.terviewedLabel.backgroundColor = [UIColor redColor];
}
#pragma mark
-(void)deliveredLabelClicked:(UITapGestureRecognizer*)gesture{
    [self.delegate didSelectMeDeliveredAtCell:self];
}

-(void)exchangedLabelClicked:(UITapGestureRecognizer*)gesture{
    [self.delegate didSelectMeTalkededAtCell:self];
}

-(void)terviewedLabelClicked:(UITapGestureRecognizer*)gesture{
    [self.delegate didSelectMeInterviewedAtCell:self];
}

#pragma mark
-(UIImageView*)profileImgv{
    if (!_profileImgv) {
        _profileImgv = [[UIImageView alloc] init];
        _profileImgv.layer.masksToBounds = YES;
        _profileImgv.layer.cornerRadius = 32;
        _profileImgv.image = [UIImage imageNamed:@"img_login_boy_profile"];
    }
    return _profileImgv;
}
-(UILabel*)userNameLabel{
    if (!_userNameLabel) {
        _userNameLabel = [[UILabel alloc] init];
        _userNameLabel.font = [UIFont systemFontOfSize:26];
        _userNameLabel.textColor = [UIColor at_colorWithHex:0xFFFFFF];
    }
    return _userNameLabel;
}
-(UILabel*)editResumeLabel{
    if (!_editResumeLabel) {
        _editResumeLabel = [[UILabel alloc] init];
        _editResumeLabel.text = @"查看并编辑个人简历";
        _editResumeLabel.userInteractionEnabled = YES;
        _editResumeLabel.font = [UIFont systemFontOfSize:14];
        _editResumeLabel.textColor = [UIColor at_colorWithHex:0xFFFFFF];
    }
    return _editResumeLabel;
}
-(UIImageView*)editResumeArrowImgv{
    if (!_editResumeArrowImgv) {
        _editResumeArrowImgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_arrow"]];
    }
    return _editResumeArrowImgv;
}

-(UILabel*)deliveredLabel{
    if (!_deliveredLabel) {
        _deliveredLabel = [[UILabel alloc] init];
        _deliveredLabel.userInteractionEnabled = YES;
        [_deliveredLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(deliveredLabelClicked:)]];
    }
    return _deliveredLabel;
}
-(UILabel*)exchangedLabel{
    if (!_exchangedLabel) {
        _exchangedLabel = [[UILabel alloc] init];
        _exchangedLabel.userInteractionEnabled = YES;
         [_exchangedLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(exchangedLabelClicked:)]];
    }
    return _exchangedLabel;
}
-(UILabel*)terviewedLabel{
    if (!_terviewedLabel) {
        _terviewedLabel = [[UILabel alloc] init];
        _terviewedLabel.userInteractionEnabled = YES;
         [_terviewedLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(terviewedLabelClicked:)]];
    }
    return _terviewedLabel;
}
-(UIView*)dividedLinev1{
    if (!_dividedLinev1) {
        _dividedLinev1 = [[UIView alloc] init];
        _dividedLinev1.backgroundColor = [UIColor at_colorWithHex:0xFFFFFF];
    }
    return _dividedLinev1;
}
-(UIView*)dividedLinev2{
    if (!_dividedLinev2) {
        _dividedLinev2 = [[UIView alloc] init];
        _dividedLinev2.backgroundColor = [UIColor at_colorWithHex:0xFFFFFF];
    }
    return _dividedLinev2;
}
@end
