//
//  ManageCollectionTagsView.h
//  Shuangdaojia_Merchant
//
//  Created by XXX on 2017/7/19.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManageEditTagsViewController.h"

@interface ManageCollectionTagsView : UICollectionView

/**
 数据源
 */
@property (nonatomic, strong) NSMutableArray *dataArray;

/**
 item选择回调
 */
@property (nonatomic, copy) void (^didSelectItemAtIndexPath)(NSIndexPath *);

/**
 构造

 @param frame frame description
 */
- (instancetype)initWithFrame:(CGRect)frame collectionViewLayout:(UICollectionViewLayout *)layout;

@end
