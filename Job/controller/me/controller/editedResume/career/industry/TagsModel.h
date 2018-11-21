//
//  TagsModel.h
//  Shuangdaojia_Merchant
//
//  Created by XXX on 2017/2/22.
//  Copyright © 2017年 Daochan. All rights reserved.
//

// TODO: 删掉 - XXX
#import <Foundation/Foundation.h>

@interface TagsModel: NSObject

/**
 标签id
 */
@property (nonatomic, strong) NSNumber *signId;

/**
 标签标题
 */
@property (nonatomic, strong) NSString *signName;

/**
 标签颜色
 */
@property (nonatomic, strong) NSString *color;

/**
 标签构造

 @param tagName name
 @return return value description
 */
- (instancetype)initWithTagName:(NSString *)tagName;

@end
