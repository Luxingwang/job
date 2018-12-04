//
//  FJUserSendEmailTypeController.m
//  Job
//
//  Created by 小黑胖 on 2018/11/26.
//  Copyright © 2018 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "FJUserSendEmailTypeController.h"

@interface FJUserSendEmailItemView()
@property (nonatomic,strong) UILabel *typeLabel;
@property (nonatomic,strong) UIImageView *typeIconImgv;
@end

@implementation FJUserSendEmailItemView

-(instancetype)initWithImg:(NSString*)img name:(NSString*)name
{
    self = [super init];
    if (self) {
        [self setUpSubviews];
        [self initConstraints];
        [self.typeLabel setText:name];
        [self.typeIconImgv setImage:[UIImage imageNamed:img]];
    }
    return self;
}

-(void)setUpSubviews
{
    [self addSubview:self.typeLabel];
    [self addSubview:self.typeIconImgv];
}

-(void)initConstraints{
    [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self);
        make.height.mas_equalTo(35);
    }];
    [self.typeIconImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.typeLabel.mas_top);
    }];
    
}

-(UIImageView*)typeIconImgv
{
    if (!_typeIconImgv) {
        _typeIconImgv = [[UIImageView alloc] init];
        _typeIconImgv.layer.cornerRadius = _typeIconImgv.bounds.size.width/2.0;
        _typeIconImgv.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _typeIconImgv;
}

#pragma mark getter methods
-(UILabel*)typeLabel
{
    if (!_typeLabel) {
        _typeLabel = [[UILabel alloc] init];
        _typeLabel.font = [UIFont systemFontOfSize:16];
        _typeLabel.textAlignment = NSTextAlignmentCenter;
        _typeLabel.textColor = [UIColor at_colorWithHex:0x3E3A39];
    }
    return _typeLabel;
}

@end

@interface FJUserSendEmailTypeController ()
@property (nonatomic,strong) UILabel *tipLabel;
@property (nonatomic,strong) UIView *tipLabelBkgView;
@property (nonatomic,strong) FJUserSendEmailItemView *hideNameItemView;
@property (nonatomic,strong) FJUserSendEmailItemView *realNameItemView;

@end

@implementation FJUserSendEmailTypeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self initConstraints];
    self.navigationItem.title = @"局长信箱";
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)setUpSubviews
{
    [self.view addSubview:self.tipLabelBkgView];
    [self.tipLabelBkgView addSubview:self.tipLabel];
    [self.view addSubview:self.tipLabel];
    [self.view addSubview:self.hideNameItemView];
    [self.view addSubview:self.realNameItemView];
}

-(void)initConstraints
{
    [self.tipLabelBkgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(54);
    }];
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.mas_equalTo(self.tipLabelBkgView);
        make.left.mas_equalTo(19);
        make.right.mas_equalTo(-19);
    }];
    [self.hideNameItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tipLabel.mas_bottom).offset(100);
        make.right.mas_equalTo(self.view.mas_centerX).offset(-15);
        make.width.mas_equalTo(105);
        make.height.mas_equalTo(105+35);
    }];
    [self.realNameItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tipLabel.mas_bottom).offset(100);
        make.left.mas_equalTo(self.view.mas_centerX).offset(15);
        make.width.mas_equalTo(105);
        make.height.mas_equalTo(105+35);
    }];
}

#pragma mark
-(UIView*)tipLabelBkgView
{
    if (!_tipLabelBkgView) {
        _tipLabelBkgView = [[UIView alloc] init];
        _tipLabelBkgView.backgroundColor = [UIColor redColor];
    }
    return _tipLabelBkgView;
}

-(UILabel*)tipLabel
{
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
        _tipLabel.text = @"和局长分享你在求职中遇到的难事趣事,局长会在每周固定的时间回复您的信件";
        _tipLabel.font = [UIFont systemFontOfSize:14];
        _tipLabel.numberOfLines = 0;
        _tipLabel.textColor = [UIColor at_colorWithHex:0xFFFFFF];
    }
    return _tipLabel;
}

-(FJUserSendEmailItemView*)hideNameItemView
{
    if (!_hideNameItemView){
        _hideNameItemView = [[FJUserSendEmailItemView alloc] initWithImg:@"img_user_write_email_hide_name" name:@"匿名交流"];
    }
    return _hideNameItemView;
}

-(FJUserSendEmailItemView*)realNameItemView
{
    if (!_realNameItemView) {
        _realNameItemView = [[FJUserSendEmailItemView alloc] initWithImg:@"img_user_write_email_real_name" name:@"匿名交流"];
    }
    return _realNameItemView;
}

@end
