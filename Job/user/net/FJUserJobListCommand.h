//
//  FJUserJobListCommand.h
//  Job
//
//  Created by 小黑胖 on 2018/10/11.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJNetworkCommand.h"
typedef NS_ENUM(NSUInteger,UserRelatedJobListType){
    UserRelatedJobListTypeCollected =0,
    UserRelatedJobListTypeDeliveredReached =1,
    UserRelatedJobListTypeDeliveredReaded =2,
    UserRelatedJobListTypeDeliveredImproper =3,
    UserRelatedJobListTypeDeliveredTalked =4,
    UserRelatedJobListTypeDeliveredInterviewed =5
};

@interface FJUserJobListCommand : FJNetworkCommand
@property (nonatomic,assign) UserRelatedJobListType listType;
@end
