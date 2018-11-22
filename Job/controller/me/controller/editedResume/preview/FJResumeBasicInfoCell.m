//
//  FJResumeBasicInfoCell.m
//  Job
//
//  Created by XXX on 2018/10/31.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJResumeBasicInfoCell.h"

@interface FJResumeBasicInfoCell()
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *posionLabel;
@property (nonatomic, strong) UIImageView *iconImageView;

@end
@implementation FJResumeBasicInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.nameLabel = [[UILabel alloc]init];
        self.nameLabel.font = [UIFont systemFontOfSize:26];
        self.nameLabel.textColor = [UIColor at_colorWithHex:0x3E3A39];
        
        self.posionLabel = [[UILabel alloc]init];
        self.posionLabel.font = [UIFont systemFontOfSize:14];
        self.posionLabel.textColor = [UIColor at_colorWithHex:0x727171];
        
        self.iconImageView = [[UIImageView alloc] init];
        self.iconImageView.layer.masksToBounds = YES;
        
        [self.contentView addSubviews:@[self.nameLabel, self.posionLabel, self.iconImageView]];
        
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.offset(0);
            make.right.offset(-24);
            make.size.mas_equalTo(CGSizeMake(63, 63));
        }];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(24);
            make.centerY.offset(10);
        }];
        
        [self.posionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(24);
            make.centerY.offset(-10);
        }];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
