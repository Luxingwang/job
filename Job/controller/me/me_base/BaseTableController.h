//
//  BaseTableViewController.h
//  Shuangdaojia_Customer
//
//  Created by XXX on 15/8/29.
//  Copyright © 2015年 Daochan. All rights reserved.
//  没有数据交互的TableViewController都继承于此

#import "FJBaseController.h"
#import "TitleArrowCell.h"

@interface BaseTableController : FJBaseController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

/**
 *  是否分组 需在 super viewDidLoad 前设置
 */
@property (nonatomic, assign) BOOL isGrouped;

@property (nonatomic, strong) NSArray *titleList;

@property (nonatomic, strong) NSArray *dataList;

- (void)addBottomButtonWithActionBlock:(void(^)(void))actionBlock;

@end
