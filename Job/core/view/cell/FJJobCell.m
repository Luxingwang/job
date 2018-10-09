//
//  FJJobCell.m
//  Job
//
//  Created by 小黑胖 on 2018/10/4.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJJobCell.h"
#import "UIColor+Extension.h"
@implementation FJJobCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUpCell];
    }
    return self;
}

-(void)setUpCell{
    self.backgroundColor = [UIColor greenColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

-(void)setUpSubviews{
    
}

-(void)initConstraints{
    
}
@end
