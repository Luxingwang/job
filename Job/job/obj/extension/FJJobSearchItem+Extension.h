//
//  FJJobSearchItem+Extension.h
//  Job
//
//  Created by 小黑胖 on 2018/12/7.
//  Copyright © 2018 lxw. All rights reserved.
//

#import "FJJobSearchItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface FJJobSearchItem (Extension)
@property (nonatomic,strong) NSNumber *descriptionWidth;
@property (nonatomic,strong) NSNumber *needDisplayAtHeight;
@property (nonatomic,strong,nullable) NSMutableAttributedString *attributedDescription;
@end

NS_ASSUME_NONNULL_END
