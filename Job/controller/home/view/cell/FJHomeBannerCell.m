//
//  FJHomeBannerCell.m
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJHomeBannerCell.h"
@interface FJHomeBannerCell ()
@property (nonatomic,strong) UIImageView *coverImv;
@end
@implementation FJHomeBannerCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.coverImv];
        [self.coverImv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        self.coverImv.image = [UIImage imageNamed:@"img_home_banner.jpg"];
        
    }
    return self;
}

-(UIImageView*)coverImv{
    if (!_coverImv) {
        _coverImv = [[UIImageView alloc] init];
        _coverImv.layer.masksToBounds = YES;
        _coverImv.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _coverImv;
}
@end
