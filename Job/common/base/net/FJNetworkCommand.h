//
//  FJNetworkCommand.h
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking/AFNetworking.h"
@interface FJNetworkCommand : NSObject
typedef enum REQUEST_TYPE{
    GET    = 0,
    POST   = 1,
    PUT    = 2,
    DELETE =3
}REQUEST_TYPE;
typedef void (^SUCCESS_BLOCK)(id data);
typedef void (^PAGE_SUCCESS_BLOCK)(id data,BOOL allFetch);
typedef void (^FAILURE_BLOCK)(NSString* msg);
@property (nonatomic,copy) NSString *networkUrl;
@property (nonatomic,copy) FAILURE_BLOCK errorBlock;
@property (nonatomic,copy) SUCCESS_BLOCK successBlock;
@property (nonatomic,copy) PAGE_SUCCESS_BLOCK pageSuccessBlock;

-(AFHTTPSessionManager*)networkEngine;

-(void)execute;

- (void)successHandle:(id)data;

- (void)errorHandle:(NSString*)msg;

-(void)sendRequestWithUrl:(NSString *)url method:(REQUEST_TYPE)requestType;

-(void)sendRequestWithUrl:(NSString *)url method:(REQUEST_TYPE)requestType parameter:(NSDictionary*)params;

@end
