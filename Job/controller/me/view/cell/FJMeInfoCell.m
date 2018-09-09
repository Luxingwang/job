//
//  FJMeInfoCell.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJMeInfoCell.h"
@interface FJMeInfoCell()
@property (nonatomic,strong) UIImageView *profileImgv;
@property (nonatomic,strong) UILabel *userNameLabel;
@property (nonatomic,strong) UILabel *editResumeLabel;
@property (nonatomic,strong) UIImageView *editResumeArrowImgv;
@property (nonatomic,strong) UILabel *deliveredLabel;
@property (nonatomic,strong) UILabel *exchangedLabel;
@property (nonatomic,strong) UILabel *terviewedLabel;
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
}

-(void)setUpSubviews{
    
}

-(void)initConstraints{
    
}

@end
