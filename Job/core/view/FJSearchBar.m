//
//  FJSearchBar.m
//  Job
//
//  Created by 小黑胖 on 2018/12/6.
//  Copyright © 2018 lxw. All rights reserved.
//

#import "FJSearchBar.h"

@implementation FJSearchBar
-(void)layoutSubviews{
    [super layoutSubviews];
    UIEdgeInsets textFiledInset = self.textFiledInset;
    UITextField *searchField = [self valueForKey:@"searchField"];
    if (textFiledInset.top||textFiledInset.left||textFiledInset.bottom||textFiledInset.right) {
        searchField.frame = CGRectMake(textFiledInset.left,textFiledInset.top,self.frame.size.width-textFiledInset.left-textFiledInset.right,self.frame.size.height-textFiledInset.top-textFiledInset.bottom);
    }
    /**/
    if (self.textFiledBackgroundColor) {
        searchField.backgroundColor = self.textFiledBackgroundColor;
    }
}

@end
