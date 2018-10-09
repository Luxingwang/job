//
//  FJUser+Extension.m
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJUser+Extension.h"

@implementation FJUser (Extension)
-(BOOL)isLogin{
    return self.userId.length==0?NO:YES;
}
@end
