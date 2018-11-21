//
//  FJEditedFooterAddView.h
//  Job
//
//  Created by XXX on 2018/10/15.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FJEditedFooterAddView : UITableViewHeaderFooterView
@property (nonatomic, strong) NSString *title;
@property (nonatomic, copy) void (^addBlock)(void);
@end

NS_ASSUME_NONNULL_END
