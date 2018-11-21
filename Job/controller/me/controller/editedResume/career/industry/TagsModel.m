//
//  TagsModel.m
//  Shuangdaojia_Merchant
//
//  Created by XXX on 2017/2/22.
//  Copyright © 2017年 Daochan. All rights reserved.
//

#import "TagsModel.h"

@implementation TagsModel
- (instancetype)initWithTagName:(NSString *)tagName
{
    if (self = [super init]) {
        _signName = tagName;
    }
    return self;
}
@end
