//
//  FHHomeEntranceItemCell.m
//  Job
//
//  Created by 小黑胖 on 2018/10/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "UIColor+Extension.h"
#import "FJHomeEntranceItemCell.h"
@interface FJHomeEntranceItemCell()
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *itemImgv;
@end
@implementation FJHomeEntranceItemCell
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
    [self addSubview:self.itemImgv];
    [self addSubview:self.titleLabel];
}

-(void)initConstraints{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(28);
        make.left.right.bottom.mas_equalTo(0);
    }];
    [self.itemImgv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.width.height.mas_equalTo(46);
        make.bottom.mas_equalTo(self.titleLabel.mas_top);
    }];
}

-(void)setEntranceItem:(FJHomeEntranceItem *)entranceItem
{
    if (entranceItem!=_entranceItem) {
        _entranceItem = entranceItem;
        _titleLabel.text = entranceItem.title;
        _itemImgv.image = [UIImage imageNamed:entranceItem.imgName];
    }
}

#pragma mark
-(UIImageView*)itemImgv{
    if (!_itemImgv) {
        _itemImgv = [[UIImageView alloc] init];
        _itemImgv.layer.masksToBounds = YES;
        _itemImgv.layer.cornerRadius = _itemImgv.frame.size.width/2.0;
    }
    return _itemImgv;
}

-(UILabel*)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor at_colorWithHex:0x595757];
    }
    return _titleLabel;
}
@end
