//
//  FJBaseLoginTextField.h
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import <Masonry.h>
#import "FJTextField.h"
#import "UIColor+Extension.h"
@interface FJBaseLoginTextField : FJTextField
@property (nonatomic,strong) UIView *linev;
- (void)setUpSubviews;
- (void)initConstraints;
@end
