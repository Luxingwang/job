//
//  FJResumeCareerCell.m
//  Job
//
//  Created by 于可心 on 2018/11/22.
//  Copyright © 2018 lxw. All rights reserved.
//

#import "FJResumeCareerCell.h"

@interface FJResumeCareerCell ()
@property (nonatomic, strong) UILabel *careerLabel;
@property (nonatomic, strong) UILabel *industryLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@end

@implementation FJResumeCareerCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.careerLabel = [[UILabel alloc]init];
        self.careerLabel.font = [UIFont systemFontOfSize:26];
        self.careerLabel.textColor = [UIColor at_colorWithHex:0x3E3A39];
        
        self.industryLabel = [[UILabel alloc]init];
        self.industryLabel.font = [UIFont systemFontOfSize:14];
        self.industryLabel.textColor = [UIColor at_colorWithHex:0x727171];
        
        self.priceLabel = [[UILabel alloc] init];
        self.priceLabel.font = [UIFont systemFontOfSize:14];
        self.priceLabel.textColor = [UIColor at_colorWithHex:0x727171];
        
        [self.contentView addSubviews:@[self.careerLabel, self.industryLabel, self.priceLabel]];
        
        
        [self.careerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(24);
            make.top.offset(23);
        }];
        
        [self.industryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(24);
            make.top.equalTo(self.careerLabel.mas_bottom).offset(10);
            make.bottom.offset(-23);
        }];
        
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(-24);
            make.centerY.offset(0);
        }];
        
    }
    return self;
}
@end
