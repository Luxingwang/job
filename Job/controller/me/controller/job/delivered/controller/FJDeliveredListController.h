//
//  FJDeliveredListController.h
//  Job
//
//  Created by 小黑胖 on 2018/10/4.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJBaseController.h"
typedef NS_ENUM(NSUInteger,DeliveredListType){
    DeliveredListTypeReached =0,
    DeliveredListTypeReaded =1,
    DeliveredListTypeImproper =2
};
@interface FJDeliveredListController : FJBaseController
@property (nonatomic,assign) NSInteger offsetPage;
@property (nonatomic,assign) DeliveredListType listType;
@end
