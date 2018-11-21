//
//  ManageCollectionTagsFlowLayout.h
//  Shuangdaojia_Merchant
//
//  Created by XXX on 2017/9/23.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,TagsType){
    TagsTypeWithLeft,       // 居左
    TagsTypeWithCenter,     // 居中
    TagsTypeWithRight       // 居右
};

@interface ManageCollectionTagsFlowLayout : UICollectionViewFlowLayout

/**
 之前距离
 */
@property (nonatomic, assign) CGFloat betweenOfCell;

/**
 cell类型
 */
@property (nonatomic, assign) TagsType cellType;

/**
 构造方法

 @param cellType cell类型
 @return return value description
 */
-(instancetype)initWithType:(TagsType)cellType;

@end
