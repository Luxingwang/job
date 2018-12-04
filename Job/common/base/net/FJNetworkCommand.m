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
        networkEngine = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.windwalker.club"] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [self setUpEngine:networkEngine];
    });
    return networkEngine;
}

-(void)setUpEngine:(AFHTTPSessionManager*)mannger{
    NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"fj" ofType:@"cer"];
    NSData *certData = [NSData dataWithContentsOfFile:cerPath];
    AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    securityPolicy.allowInvalidCertificates = YES;
    securityPolicy.validatesDomainName = YES;
    securityPolicy.pinnedCertificates = [NSSet setWithObject:certData];
    mannger.securityPolicy=securityPolicy;
    mannger.requestSerializer=[AFJSONRequestSerializer serializer];
    mannger.responseSerializer = [AFJSONResponseSerializer serializer];
    ((AFJSONResponseSerializer*)(mannger.responseSerializer)).removesKeysWithNullValues = YES;
    [mannger.requestSerializer setValue:@"ios" forHTTPHeaderField:@"os"];
    [mannger.requestSerializer setValue:@"1.0.1" forHTTPHeaderField:@"version"];
    [mannger.requestSerializer setValue:@"1" forHTTPHeaderField:@"uid"];
}

-(void)sendRequestWithUrl:(NSString *)url method:(REQUEST_TYPE)requestType{
    [self sendRequestWithUrl:url method:requestType parameter:nil data:nil];
}

-(void)sendRequestWithUrl:(NSString *)url method:(REQUEST_TYPE)requestType parameter:(NSDictionary*)params{
    [self sendRequestWithUrl:url method:requestType parameter:params data:nil];
}

-(void)sendRequestWithUrl:(NSString *)url method:(REQUEST_TYPE)requestType data:(NSData *)data{
    [self sendRequestWithUrl:url method:requestType parameter:nil data:data];
}

-(void)sendRequestWithUrl:(NSString *)url method:(REQUEST_TYPE)requestType parameter:(NSDictionary*)params data:(NSData *)data{
    NSString *requestMethod = @"POST";
    if (requestType==GET) {
        requestMethod = @"GET";
    }else if (requestType==PUT) {
        requestMethod = @"PUT";
    }else if (requestType==DELETE) {
        requestMethod = @"DELETE";
    }
    NSString *encodingURLString=[url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSMutableURLRequest * request=[[self networkEngine].requestSerializer multipartFormRequestWithMethod:requestMethod URLString:encodingURLString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (data) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyyMMddHHmmss";
            NSString *fileName = [NSString stringWithFormat:@"%@.png", [formatter stringFromDate:[NSDate date]]];
            [formData appendPartWithFileData:data name:@"file" fileName:fileName mimeType:@"image/png"];
        }
    } error:nil];
    request.timeoutInterval = 10;
    NSURLSessionDataTask *dataTask = [[self networkEngine] dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error){
        if (error){
            [self errorHandle:error.localizedDescription];
        } else{
            [self handleResponse:responseObject];
        }
    }];
    [dataTask resume];
}
-(void)handleResponse:(id)response
{
    if ([response isKindOfClass:[NSDictionary class]]==NO)
    {
        [self errorHandle:@"数据格式有误"];
    }else
    {
        BOOL success = [[response objectForKey:@"success"] boolValue];
        if (success==NO) {
            NSString *msg = [response objectForKey:@"msg"];
            if (msg){
                [self errorHandle:msg];
            }
            else{
                [self errorHandle:@"未知错误"];
            }
        }else{
            id result = [response objectForKey:@"result"];
            [self successHandle:result];
        }
    }
}

- (void)errorHandle:(NSString*)msg{
    if (self.errorBlock) {
        self.errorBlock(msg);
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
