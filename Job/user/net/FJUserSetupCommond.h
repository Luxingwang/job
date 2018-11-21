//
//  FJUserSetupCommond.h
//  Job
//
//  Created by XXX on 2018/10/30.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJNetworkCommand.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, FJUserSetupCommondType){
    FJUserSetupCommondTypeEditPhone,
    FJUserSetupCommondTypeGetPhoneCode,
    FJUserSetupCommondTypeEditPassword,
    FJUserSetupCommondTypeMessageNotice,
    
};


@interface FJUserSetupCommond : FJNetworkCommand

@property (nonatomic, assign) FJUserSetupCommondType type;

- (instancetype)initWithParams:(NSDictionary *)params successBlock:(SUCCESS_BLOCK)successBlock errorBlock:(FAILURE_BLOCK)errorBlock;
@end

NS_ASSUME_NONNULL_END
