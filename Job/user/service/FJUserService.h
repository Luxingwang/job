//
//  FJUserService.h
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FJUserService : NSObject
+(FJUserService*)instance;
-(void)fetchFastLoginVertifyCode:(NSString*)phone;
@end