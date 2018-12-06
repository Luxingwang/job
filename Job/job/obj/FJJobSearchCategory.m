//
//  FJJobSearchCategory.m
//  Job
//
//  Created by 小黑胖 on 2018/12/7.
//  Copyright © 2018 lxw. All rights reserved.
//
#import "FJJobSearchItem.h"
#import "FJJobSearchCategory.h"
NSString *getDescribeByCategoryKey(NSString* key)
{
    NSDictionary *describeInfo = @{@"INCOME_LEVEL":@"薪资",
                                   @"EDUCATION":@"学历",
                                   @"COMPANY_STAGE":@"融资阶段",
                                   @"COMPANY_SCALE":@"公司规模",
                                   @"WORK_EXP":@"工作经验",
                                   @"WORK_TYPE":@"工作性质",
                                   @"HOT_POST":@"热门岗位",
                                   @"INDUSTRY":@"行业信息"
                                   };
    return [describeInfo objectForKey:key];
}



@implementation FJJobSearchCategory

- (instancetype)init
{
    self = [super init];
    self.searchItems = [NSMutableArray array];
    return self;
}

+ (NSMutableArray*)arrayFrom:(NSArray *)array
{
    NSDictionary *dictionary = (NSDictionary*)array;
    NSMutableArray *list = [NSMutableArray array];
    for (NSString *key in dictionary.allKeys)
    {
        FJJobSearchCategory *category = [[FJJobSearchCategory alloc] init];
        category.categoryKey = key;
        category.describe = getDescribeByCategoryKey(key);
        NSArray *searchItems = [dictionary objectForKey:key];
        for (NSString *describe in searchItems)
        {
            FJJobSearchItem *item = [[FJJobSearchItem alloc] init];
            item.searchKey = describe;
            [category.searchItems addObject:item];
        }
        [list addObject:category];
    }
    return list;
}

@end
