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
        
    }
    return self;
}

-(void)setUpSubviews
{
    
}

-(void)initConstraints{
    
}

@end

@interface FJUserSendEmailTypeController ()
@property (nonatomic,strong) UILabel *tipLabel;
@property (nonatomic,strong) FJUserSendEmailItemView *hideNameItemView;
@property (nonatomic,strong) FJUserSendEmailItemView *realNameItemView;

@end

@implementation FJUserSendEmailTypeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    self.navigationItem.title = @"局长信箱";
}

-(void)setUpSubviews
{
    [self.view addSubview:self.tipLabel];
    [self.view addSubview:self.hideNameItemView];
    [self.view addSubview:self.realNameItemView];
}

-(void)initConstraints
{
    [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self.view);
        //make.height.mas_equalTo()
    }];
}

#pragma mark
-(UILabel*)tipLabel
{
    if (!_tipLabel) {
        _tipLabel = [[UILabel alloc] init];
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
