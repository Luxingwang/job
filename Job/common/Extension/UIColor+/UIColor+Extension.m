//
//  UIColor+Extension.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+ (UIColor *)at_colorWithHex:(NSInteger)hexValue
{
    return [UIColor at_colorWithHex:hexValue alpha:1.0];
}

+ (UIColor *)at_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}
@end
