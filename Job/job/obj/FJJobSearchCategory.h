//
//  FJJobSearchCategory.h
//  Job
//
//  Created by 小黑胖 on 2018/12/7.
//  Copyright © 2018 lxw. All rights reserved.
//

#import "FJBaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface FJJobSearchCategory : FJBaseObject
@property (nonatomic,copy) NSString *describe;
@property (nonatomic,copy) NSString *categoryKey;
@property (nonatomic,strong) NSMutableArray *searchItems;

@end

NS_ASSUME_NONNULL_END
