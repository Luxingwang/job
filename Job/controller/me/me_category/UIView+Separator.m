//
//  UIView+Separator.m
//  Shuangdaojia_Customer
//
//  Created by XXX on 15/9/6.
//  Copyright © 2015年 Daochan All rights reserved.
//

#import "UIView+Separator.h"
#import <objc/runtime.h>

NSString * const separatorKey       = @"SeparatorKey";
NSString * const separatorTypeKey   = @"SeparatorTypeKey";

#define ONE_PHYSICAL_PX  1.f/[UIScreen mainScreen].scale

@implementation UIView (Separator)

#pragma mark - 分割线

- (UIView *)separator
{
    UIView *view = objc_getAssociatedObject(self, &separatorKey);
    if (!view) {
        view = [UIView separator];
        [self addSubview:view];
        objc_setAssociatedObject(self, &separatorKey, view, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return view;
}

#pragma mark - 分割线类型

- (SeparatorType)separatorType
{
    return [objc_getAssociatedObject(self, &separatorTypeKey) integerValue];
}

- (void)setSeparatorType:(SeparatorType)type
{
    if (type == self.separatorType) {
        return;
    }
    
    if (type == SeparatorTypeNone) {
        UIView *view = objc_getAssociatedObject(self, &separatorKey);
        if (view) {
            [view removeFromSuperview];
            objc_setAssociatedObject(self, &separatorKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return;
    }
    
    objc_setAssociatedObject(self, &separatorTypeKey, @(type), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self setType:type heightOrWidth:ONE_PHYSICAL_PX forSeparator:self.separator];
}


#pragma mark - 添加新分割线

- (UIView *)addSeparatorWithType:(SeparatorType)type
{
    return [self addSeparatorWithType:type heightOrWidth:ONE_PHYSICAL_PX];
}

- (UIView *)addSeparatorWithType:(SeparatorType)type heightOrWidth:(CGFloat)heightOrWidth
{
    if (!type) {
        return nil;
    }
    UIView *separator = [UIView separator];
    [self addSubview:separator];
    [self setType:type heightOrWidth:heightOrWidth forSeparator:separator];
    return separator;
}

+ (UIView *)separator
{
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor at_colorWithHex:0xe9eae9];
    return view;
}


#pragma mark - Helper

- (void)setType:(SeparatorType)type heightOrWidth:(CGFloat)heightOrWidth forSeparator:(UIView *)separator
{
    [separator mas_remakeConstraints:^(MASConstraintMaker *make) {
        switch (type) {
            case SeparatorTypeTopFill:
                make.top.left.offset(0);
                make.right.offset(0).priorityLow();
                break;
            case SeparatorTypeBottomFill:
                make.bottom.left.offset(0);
                make.right.offset(0).priorityLow();
                break;
                
            case SeparatorTypeLeftFill:
                make.top.left.offset(0);
                make.bottom.offset(0).priorityLow();
                break;
            case SeparatorTypeRightFill:
                make.top.right.offset(0);
                make.bottom.offset(0).priorityLow();
                break;
            default:
                break;
        }
        
        if (type >= SeparatorTypeLeftFill) {
            make.width.offset(MAX(ONE_PHYSICAL_PX, heightOrWidth));
        }
        else {
            make.height.offset(MAX(ONE_PHYSICAL_PX, heightOrWidth));
        }
    }];
}


@end
