//
//  FJJob.h
//  Job
//
//  Created by 小黑胖 on 2018/10/4.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJBaseObject.h"

@interface FJJob : FJBaseObject
@property (nonatomic,strong) NSString *postId;
@property (nonatomic,strong) NSString *postImg;
@property (nonatomic,strong) NSString *postName;
@property (nonatomic,strong) NSString *companyId;
@property (nonatomic,strong) NSString *incomeLevel;
@property (nonatomic,strong) NSString *companyName;
@property (nonatomic,strong) NSString *companyStage;
@end
