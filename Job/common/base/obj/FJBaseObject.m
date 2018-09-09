//
//  FJBaseObject.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//
#import "FJBaseObject.h"
@implementation FJBaseObject
+(NSMutableArray*)arrayFrom:(NSArray*)array{
    return [NSMutableArray array];
    
}
+(FJBaseObject*)objectFrom:(NSDictionary*)dictionary{
    return [[FJBaseObject alloc] init];
}
@end
