//
//  TitleArrowCell.h
//  Job
//
//  Created by XXX on 2018/10/15.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJBaseTableViewCell.h"
#import "FilletImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface TitleArrowCell : FJBaseTableViewCell

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) FilletImageView *iconImageView;

@property (nonatomic, strong) UIView *separator;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UIImageView *arrow;
@property (nonatomic, strong) UISwitch *uiSwitch;
@property (nonatomic, strong) UITextField *textField;

@property (nonatomic, assign) BOOL isIconRight;

@property (nonatomic, strong) void (^switchBlock)(BOOL);
@property (nonatomic, strong) void (^textFieldBlock)(NSString *);

- (void)hiddenArraw;

@end

NS_ASSUME_NONNULL_END
