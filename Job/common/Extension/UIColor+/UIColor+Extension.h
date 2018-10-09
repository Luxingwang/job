//
//  UIColor+Extension.h
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)

+ (UIColor *)at_colorWithHex:(NSInteger)hexValue;
/**
 设置十六进制颜色和透明度
 @param hexValue 十六进制值
 @param alphaValue 透明度
 @return 颜色
 */
+ (UIColor *)at_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
@end
