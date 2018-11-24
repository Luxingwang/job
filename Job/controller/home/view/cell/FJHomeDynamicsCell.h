//
//  FJHomeDynamicsCell.h
//  Job
//
//  Created by 小黑胖 on 2018/10/8.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJInfomationLite.h"
#import "FJBaseCollectionCell.h"

@interface FJHomeDynamicsCell : FJBaseCollectionCell
@property (nonatomic,strong) NSArray *dynamicsList;
@end

/**
 动态列表 单条cell
 */
@interface FJHomeDynamicsItemCell : FJBaseCollectionCell
@property (nonatomic,strong) FJInfomationLite *infomationLite;

@end


