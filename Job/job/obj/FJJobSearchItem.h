//
//  FJJobSearchItem.h
//  Job
//
//  Created by 小黑胖 on 2018/12/7.
//  Copyright © 2018 lxw. All rights reserved.
//

#import "FJBaseObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface FJJobSearchItem : FJBaseObject
@property (nonatomic,copy)   NSString *searchKey;

#pragma mark local
-(NSMutableAttributedString*)assembleAttributedString;

@end

NS_ASSUME_NONNULL_END
