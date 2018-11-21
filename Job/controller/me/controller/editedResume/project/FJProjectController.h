//
//  FJProjectController.h
//  Job
//
//  Created by XXX on 2018/10/16.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "BaseTableController.h"
#import "FJUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface FJProjectController : BaseTableController
- (instancetype)initWithUser:(FJUser *)user completionCallBack:(void (^)(void))callBack;
@end

NS_ASSUME_NONNULL_END
