//
//  FJExchangeListController.h
//  Job
//
//  Created by 小黑胖 on 2018/10/4.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJBaseController.h"
typedef NS_ENUM(NSUInteger,ExchangeListType){
    ExchangeListAnonym =0,
    ExchangeListReal =1
};
@interface FJExchangeListController : FJBaseController
@property (nonatomic,assign) NSInteger offsetPage;
@property (nonatomic,assign) ExchangeListType listType;
@end
