//
//  FilletImageView.m
//  Shuangdaojia_Customer
//
//  Created by XXX on 15/9/9.
//  Copyright © 2015年 Daochan All rights reserved.
//

#import "FilletImageView.h"

@implementation FilletImageView

- (instancetype)init
{
    if (self = [super init]) {
        self.layer.cornerRadius = 8;
        self.layer.masksToBounds = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

- (instancetype)initWithRadius:(CGFloat)radius
{
    if (self = [super init]) {
        self.layer.cornerRadius = radius;
        self.layer.masksToBounds = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
    }
    return self;
}

- (instancetype)initWithRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor
{
    if (self = [self initWithRadius:radius]) {
        self.layer.borderWidth = borderWidth;
        self.layer.borderColor = borderColor.CGColor;
    }
    return self;
}

- (instancetype)initWithRoundStyle
{
    if (self = [super init]) {
        self.layer.masksToBounds = YES;
        self.contentMode = UIViewContentModeScaleAspectFill;
        self.roundStyle = YES;
    }
    return self;
}

+ (instancetype)roundImageView
{
    return [[self alloc] initWithRoundStyle];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.isRoundStyle) {
        self.layer.cornerRadius = MIN(self.bounds.size.width, self.bounds.size.height)/2.f;
    }
}

@end
