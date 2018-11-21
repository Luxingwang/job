//
//  UIView+AddSubview.m
//  Shuangdaojia_Technician
//
//  Created by XXX on 15/10/13.
//  Copyright © 2015年 Daochan. All rights reserved.
//

#import "UIView+AddSubview.h"

@implementation UIView (AddSubview)

- (void)addSubviews:(NSArray *)subviews
{
    for (UIView *view in subviews) {
        [self addSubview:view];
    }
}

@end
