//
//  FJTextField.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJTextField.h"

@implementation FJTextField
-(void)displayAttributedPlaceholder{
    if (self.placeholder) {
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:self.placeholder];
        [string addAttribute:NSFontAttributeName value:self.placeholderFont range:NSMakeRange(0,self.placeholder.length)];
        [string addAttribute:NSForegroundColorAttributeName value:self.placeholderColor range:NSMakeRange(0,self.placeholder.length)];
        self.attributedPlaceholder = string;
    }
}
@end
