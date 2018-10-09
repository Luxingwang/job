//
//  FJMeEntranceCell.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJMeEntranceCell.h"
@interface FJMeEntranceCell()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *subtitleLabel;
@property (nonatomic,strong) UIImageView *iconImgv;
@property (nonatomic,strong) UIImageView *arrowImgv;
@end
@implementation FJMeEntranceCell
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
    self.layoutMargins = UIEdgeInsetsZero;
    self.separatorInset = UIEdgeInsetsZero;
    self.backgroundColor = [UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setUpSubviews{
    [self addSubview:self.iconImgv];
    [self addSubview:self.titleLabel];
    [self addSubview:self.subtitleLabel];
    [self addSubview:self.arrowImgv];
}

-(void)initConstraints{
    [self.iconImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(20);
        make.size.mas_equalTo(CGSizeMake(20,20));
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    [self.arrowImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.size.mas_equalTo(self.arrowImgv.frame.size);
        make.centerY.mas_equalTo(self.mas_centerY);
    }];
    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.arrowImgv.mas_left).offset(-20);
        make.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(100);
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImgv.mas_right).offset(17);
        make.top.bottom.mas_equalTo(0);
        make.right.mas_equalTo(self.subtitleLabel.mas_left);
    }];
}
#pragma mark
-(void)setInfoDictionary:(NSDictionary *)infoDictionary{
    if (infoDictionary!=_infoDictionary) {
        _infoDictionary = infoDictionary;
        _titleLabel.text = infoDictionary[@"title"];
        _iconImgv.image = [UIImage imageNamed:infoDictionary[@"imgName"]];
    }
}

#pragma mark
-(UILabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
    }
    return _titleLabel;
}

-(UILabel*)subtitleLabel{
    if (!_subtitleLabel) {
        _subtitleLabel = [[UILabel alloc] init];
    }
    return _subtitleLabel;
}

-(UIImageView*)iconImgv{
    if (!_iconImgv) {
        _iconImgv = [[UIImageView alloc] init];
    }
    return _iconImgv;
}

-(UIImageView*)arrowImgv{
    if (!_arrowImgv) {
        _arrowImgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_arrow"]];
    }
    return _arrowImgv;
}
@end
