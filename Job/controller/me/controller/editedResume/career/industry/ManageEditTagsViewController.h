//
//  ManageEditTagsViewController.h
//  Shuangdaojia_Merchant
//
//  Created by XXX on 2017/7/19.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FJBaseController.h"

@interface ManageEditTagsViewController : FJBaseController

/**
 保存标签回调
 */
@property (nonatomic, copy) void (^saveTagsBlock)(NSArray *);


/**
 collectionCell Reload结束 更新所在Cell的Height
 */
@property (nonatomic, copy) void (^updateCellHeight)(CGFloat);

/**
 标签数据源
 */
@property (nonatomic, strong) NSArray *dataTagList;

/**
 构造

 @param vcType 界面类型
 @param dataTagList 数据源
 @return return value description
 */
- (instancetype)initWithAlreadyTagList:(NSArray *)tagList;
@end
