//
//  FJLoginPasswordTextField.h
//  Job
//
//  Created by 小黑胖 on 2018/10/2.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJBaseLoginTextField.h"
typedef NS_ENUM(NSUInteger,LoginPasswordType){
    LoginPasswordLogin =0,
    LoginPasswordForget =1,
};
@interface FJLoginPasswordTextField : FJBaseLoginTextField
@property (nonatomic,assign) LoginPasswordType type;
@end
