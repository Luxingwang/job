//
//  FJJobSearchItem.m
//  Job
//
//  Created by 小黑胖 on 2018/12/7.
//  Copyright © 2018 lxw. All rights reserved.
//

#import "FJJobSearchItem.h"
#import "FJJobSearchItem+Extension.h"
@implementation FJJobSearchItem
-(NSMutableAttributedString*)assembleAttributedString
{
    NSMutableAttributedString *description = [[NSMutableAttributedString alloc] initWithString:self.searchKey];
    UIFont  *font = [UIFont systemFontOfSize:13];
    UIColor *textColor = [UIColor at_colorWithHex:0x3E3A39];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    
    [description addAttributes:@{NSFontAttributeName:font,
                                 NSParagraphStyleAttributeName:style,
                                 NSForegroundColorAttributeName:textColor
                                 } range:NSMakeRange(0,description.string.length)];
    self.needDisplayAtHeight = @(31);
    return description;
}
@end
