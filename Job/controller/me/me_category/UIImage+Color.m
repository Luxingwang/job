//
//  UIImage+Color.m
//  Recite_en
//
//  Created by XXX on 15/5/24.
//  Copyright © 2015年 XXX. All rights reserved.
//

#import "UIImage+Color.h"

@implementation UIImage (Color)

+ (UIImage *)imageWithColor:(UIColor* )color
{
    return [self imageWithColor:color size:CGSizeMake(1.f, 1.f)];
}

+ (UIImage *)imageWithColor:(UIColor* )color size:(CGSize)size
{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
