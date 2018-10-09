//
//  FJLoginHandleButton.h
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger,LoginHandleType){
    LoginHandleTypeFast =0,
    LoginHandleTypeAccount =1,
    LoginHandleTypeResetPassword =2
};
@interface FJLoginHandleButton : UIButton
//
@property (nonatomic,assign) LoginHandleType handleHandleType;
//
+ (instancetype)buttonWithHandleType:(LoginHandleType)type;

@end
