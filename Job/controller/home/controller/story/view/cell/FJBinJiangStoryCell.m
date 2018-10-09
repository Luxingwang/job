//
//  FJBinJiangStoryCell.m
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "FJBinJiangStoryCell.h"
#import "UIImageView+WebCache.h"
@interface FJBinJiangStoryCell ()
@property (nonatomic,strong) UILabel *contentLabel;
@property (nonatomic,strong) UIImageView *coverImgv;
@end
@implementation FJBinJiangStoryCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setUpCell];
        [self setUpSubviews];
        [self initConstraints];
    }
    return self;
}

-(void)setUpCell{
    self.separatorInset = UIEdgeInsetsMake(0,16,0,16);
    self.backgroundColor = [UIColor whiteColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setUpSubviews{
    [self addSubview:self.contentLabel];
    [self addSubview:self.coverImgv];
}

-(void)initConstraints{
    [self.coverImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.bottom.mas_equalTo(-14);
        make.right.mas_equalTo(-16);
        make.width.mas_equalTo(115);
    }];
    
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.top.mas_equalTo(20);
        make.bottom.mas_equalTo(-14);
        make.right.mas_equalTo(self.coverImgv.mas_left).offset(-18);
    }];
}
#pragma mark
-(void)setStory:(FJBinJiangStory *)story
{
    if (story!=_story) {
        _story = story;
        _contentLabel.text = story.title;
        [self.coverImgv sd_setImageWithURL:[NSURL URLWithString:story.titleImgs]];
    }
}

#pragma mark
-(UIImageView*)coverImgv{
    if (!_coverImgv) {
        _coverImgv = [[UIImageView alloc] init];
    }
    return _coverImgv;
}

-(UILabel*)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:18];
        _contentLabel.textColor = [UIColor at_colorWithHex:0x3E3A39];
    }
    return _contentLabel;
}
@end
