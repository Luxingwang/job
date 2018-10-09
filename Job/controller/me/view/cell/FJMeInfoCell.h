//
//  FJMeInfoCell.h
//  Job
//
//  Created by 小黑胖 on 2018/9/6.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJBaseTableViewCell.h"
@protocol FJMeInfoCellDelegate<NSObject>
-(void)didSelectMeDeliveredAtCell:(FJBaseTableViewCell*)cell;
-(void)didSelectMeTalkededAtCell:(FJBaseTableViewCell*)cell;
-(void)didSelectMeInterviewedAtCell:(FJBaseTableViewCell*)cell;
@end
@interface FJMeInfoCell : FJBaseTableViewCell
@property (nonatomic,weak) id<FJMeInfoCellDelegate> delegate;
@end
