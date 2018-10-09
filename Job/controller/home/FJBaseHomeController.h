//
//  FJBaseHomeController.h
//  Job
//
//  Created by 小黑胖 on 2018/10/6.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJBaseController.h"

@interface FJBaseHomeController : FJBaseController
@property (nonatomic,weak)   NSArray *entranceItems;
@property (nonatomic,strong) NSMutableArray *recommendJobList;
@property (nonatomic,strong) UICollectionView *collectionView;
@end
