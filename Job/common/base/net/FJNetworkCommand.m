//
//  FJNetworkCommand.m
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJNetworkCommand.h"

@implementation FJNetworkCommand
-(AFHTTPSessionManager*)networkEngine{
    static AFHTTPSessionManager *networkEngine = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        networkEngine = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [self setUpEngine:networkEngine];
    });
    return networkEngine;
}

-(void)setUpEngine:(AFHTTPSessionManager*)mannger{
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"yoga" ofType:@"cer"];
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = YES;
    securityPolicy.pinnedCertificates = [NSSet setWithObject:certData];
    mannger.securityPolicy=securityPolicy;
    mannger.requestSerializer=[AFJSONRequestSerializer serializer];
    mannger.responseSerializer = [AFJSONResponseSerializer serializer];
    ((AFJSONResponseSerializer*)(mannger.responseSerializer)).removesKeysWithNullValues = YES;
}

-(void)sendRequestWithUrl:(NSString *)url method:(REQUEST_TYPE)requestType{
    [self sendRequestWithUrl:url method:requestType parameter:nil];
}

-(void)sendRequestWithUrl:(NSString *)url method:(REQUEST_TYPE)requestType parameter:(NSDictionary*)params{
    NSString *requestMethod = @"POST";
    if (requestType==GET) {
        requestMethod = @"GET";
    }else if (requestType==PUT) {
        requestMethod = @"PUT";
    }else if (requestType==DELETE) {
        requestMethod = @"DELETE";
    }
    NSString *encodingURLString=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest * request=[[self networkEngine].requestSerializer requestWithMethod:requestMethod URLString:encodingURLString parameters:params error:nil];
    request.timeoutInterval = 10;
    NSURLSessionDataTask *dataTask = [[self networkEngine] dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error){
        if (error){
            [self errorHandle:error];
        } else{
            [self successHandle:responseObject];
        }
    }];
    [dataTask resume];
}

-(void)errorHandle:(NSError *)error{
    if (self.errorBlock) {
        self.errorBlock(error);
    }
}

-(void)successHandle:(id)data{
    if (self.successBlock) {
        self.successBlock(data);
    }
}
-(void)execute{
    NSLog(@"Error, SubClass must override this method!");
}
@end
