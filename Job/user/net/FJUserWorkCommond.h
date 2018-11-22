//
//  FJUserWorkCommond.h
//  Job
//
//  Created by XXX on 2018/10/18.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJNetworkCommand.h"
#import "FJUser.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, FJResumeCommondType){
    FJResumeCommondTypeGetDetail,
    FJResumeCommondTypeEditedUserInfo,
    FJResumeCommondTypeGetIndustry,
    FJResumeCommondTypeGetDataDictionary,
    FJResumeCommondTypeAddEdu,
    FJResumeCommondTypeEditEdu,
    FJResumeCommondTypeAddWork,
    FJResumeCommondTypeEditWork,
    FJResumeCommondTypeAddProject,
    FJResumeCommondTypeEditProject,
};

@interface FJUserWorkCommond : FJNetworkCommand

@property (nonatomic, assign) FJResumeCommondType type;
- (instancetype)initWithUser:(FJUser *__nullable)user successBlock:(SUCCESS_BLOCK)successBlock errorBlock:(FAILURE_BLOCK)errorBlock;
@end

NS_ASSUME_NONNULL_END
