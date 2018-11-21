//
//  UIImage+Color.h
//  Recite_en
//
//  Created by XXX on 15/5/24.
//  Copyright © 2015年 XXX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Color)

/**
 根据颜色生成图片
 
 @param color 颜色
 */
+ (UIImage *)imageWithColor:(UIColor*)color;

/**
 根据颜色生成图片

 @param color 颜色
 @param size  图片尺寸
 */
+ (UIImage *)imageWithColor:(UIColor* )color size:(CGSize)size;

@end
