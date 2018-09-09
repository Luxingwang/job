//
//  FJBaseObject.h
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension/MJExtension.h>
@interface FJBaseObject : NSObject
+(NSMutableArray*)arrayFrom:(NSArray*)array;
+(FJBaseObject*)objectFrom:(NSDictionary*)dictionary;
@end
