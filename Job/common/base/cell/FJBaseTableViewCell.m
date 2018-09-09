//
//  FJBaseTableViewCell.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJBaseTableViewCell.h"

@implementation FJBaseTableViewCell
+(NSString*)cellId{
    return NSStringFromClass([self class]);
}
@end
