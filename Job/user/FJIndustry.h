//
//  FJIndustry.h
//  Job
//
//  Created by XXX on 2018/10/27.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FJIndustry : NSObject

@property (nonatomic, strong) NSString *industryId;
@property (nonatomic, strong) NSString *orderIndex;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *parentId;
@property (nonatomic, strong) NSString *type;

@property (nonatomic, assign) BOOL isSelected;

@end

NS_ASSUME_NONNULL_END
