//
//  UIView+Separator.h
//  Shuangdaojia_Customer
//
//  Created by XXX on 15/9/6.
//  Copyright © 2015年 Daochan All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, SeparatorType) {
    SeparatorTypeNone,       // 无
//    SeparatorTypeTop,        // 顶部
//    SeparatorTypeBottom,     // 底部
    SeparatorTypeTopFill,    // 顶部填满
    SeparatorTypeBottomFill, // 底部填满
    
    SeparatorTypeLeftFill,   // 左边填满
    SeparatorTypeRightFill,  // 右边填满
};

@interface UIView (Separator)

#pragma mark - Single

/**
 *  分割线【只创建一次】
 */
@property (nonatomic, readonly, strong) UIView *separator;

/**
 *  分割线类型
 */
@property (nonatomic, assign) SeparatorType separatorType;

#pragma mark - Add Another

/**
 *  添加【新新新】分割线，单分割线直接用separatorType
 *
 *  @param type   分割线类型
 */
- (UIView *)addSeparatorWithType:(SeparatorType)type;


/**
 *  添加【新新新】分割线
 *
 *  @param type          分割线类型
 *  @param heightOrWidth 分割线高度或宽度
 */
- (UIView *)addSeparatorWithType:(SeparatorType)type heightOrWidth:(CGFloat)heightOrWidth;

/**
 *  快速创建分割线视图
 */
+ (UIView *)separator;


@end
