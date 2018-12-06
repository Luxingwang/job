//
//  NSMutableAttributedString+Extesion.m
//  Job
//
//  Created by 小黑胖 on 2018/12/7.
//  Copyright © 2018 lxw. All rights reserved.
//

#import "NSMutableAttributedString+Extesion.h"

@implementation NSMutableAttributedString (Extesion)
- (CGSize)boundingRectWithSize:(CGSize)size
{
    return [self boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil].size;
}
@end
