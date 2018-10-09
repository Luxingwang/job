//
//  FJBaseLoginController.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "FJBaseLoginController.h"

@implementation FJBaseLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpSubviews];
    [self initConstraints];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark
- (void)setUpSubviews{
    [self.view addSubview:self.profileImgv];
    [self.view setBackgroundColor:[UIColor at_colorWithHex:0x666666]];
}

- (void)initConstraints{
    [self.profileImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(85);
        make.centerX.mas_equalTo(self.view);
        make.size.mas_equalTo(self.profileImgv.frame.size);
    }];
}

#pragma mark
-(UIImageView*)profileImgv{
    if (!_profileImgv) {
        _profileImgv = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img_login_boy_profile"]];
    }
    return _profileImgv;
}
@end
