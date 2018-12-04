//
//  FJOnlineController.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "FJOnlineController.h"

@interface FJOnLineItemView()
@property (nonatomic,strong) UILabel *typeLabel;
@property (nonatomic,strong) UIImageView *typeIconImgv;
@end

@implementation FJOnLineItemView

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

@interface FJOnlineController ()
@property (nonatomic,strong) UILabel *tipLabel;
@property (nonatomic,strong) UIView *tipLabelBkgView;
@property (nonatomic,strong) FJOnLineItemView *hrItemView;
@property (nonatomic,strong) FJOnLineItemView *leaderItemView;
@end

@implementation FJOnlineController

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
    [self.view addSubview:self.hrItemView];
    [self.view addSubview:self.leaderItemView];
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
    [self.hrItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.tipLabel.mas_bottom).offset(100);
        make.right.mas_equalTo(self.view.mas_centerX).offset(-15);
        make.width.mas_equalTo(105);
        make.height.mas_equalTo(105+35);
    }];
    [self.leaderItemView mas_makeConstraints:^(MASConstraintMaker *make) {
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
        _tipLabel.text = @"局长将于下周二13:30-14:30在线与你畅聊，吉利HR正在分享职场中应该注意的事...";
        _tipLabel.font = [UIFont systemFontOfSize:14];
        _tipLabel.numberOfLines = 0;
        _tipLabel.textColor = [UIColor at_colorWithHex:0xFFFFFF];
    }
    return _tipLabel;
}

-(FJOnLineItemView*)hrItemView
{
    if (!_hrItemView){
        _hrItemView = [[FJOnLineItemView alloc] initWithImg:@"img_online_hr" name:@"HR在线"];
    }
    return _hrItemView;
}

-(FJOnLineItemView*)leaderItemView
{
    if (!_leaderItemView) {
        _leaderItemView = [[FJOnLineItemView alloc] initWithImg:@"img_online_leader" name:@"局长在线"];
    }
    return _leaderItemView;
}

@end
