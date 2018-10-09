//
//  FJTextField.h
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FJTextField : UITextField
@property (nonatomic,strong) UIFont  *placeholderFont;
@property (nonatomic,strong) UIColor *placeholderColor;
-(void)displayAttributedPlaceholder;
@end
