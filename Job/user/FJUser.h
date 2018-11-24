//
//  FJUser.h
//  Job
//
//  Created by 小黑胖 on 2018/9/28.
//  Copyright © 2018年 lxw. All rights reserved.
//

#import "FJBaseObject.h"

typedef NS_ENUM(NSUInteger, UserInitType){
    UserInitTypeEdu,
    UserInitTypeWork,
    UserInitTypeProject,
};

@interface FJUserEdu: FJBaseObject


/**
 id
 */
@property (nonatomic, strong) NSString *eduId;

/**
 学校
 */
@property (nonatomic, strong) NSString *school;

/**
 专业
 */
@property (nonatomic, strong) NSString *profession;

/**
 学历
 */
@property (nonatomic, strong) NSString *education;

/**
 开始时间{YYYY-MM-DD}
 */
@property (nonatomic, strong) NSDate *beginDate;

/**
 结束时间{YYYY-MM-DD}
 */
@property (nonatomic, strong) NSDate *endDate;

/**
 已转化为对应的字符串
 */
@property (nonatomic, strong) NSString *beginDateString;
@property (nonatomic, strong) NSString *endDateString;

/**
 简介
 */
@property (nonatomic, strong) NSString *des;

/**
 证书地址，多个用逗号分隔
 */
@property (nonatomic, strong) NSString *certificateImgs;
@end

@interface FJUserWork: FJBaseObject

/**
 id
 */
@property (nonatomic, strong) NSString *workId;

/**
 公司名
 */
@property (nonatomic, strong) NSString *companyName;

/**
 岗位名称
 */
@property (nonatomic, strong) NSString *postName;

/**
 部门
 */
@property (nonatomic, strong) NSString *department;

/**
 开始时间{YYYY-MM-DD}
 */
@property (nonatomic, strong) NSDate *beginDate;

/**
 结束时间{YYYY-MM-DD}
 */
@property (nonatomic, strong) NSDate *endDate;

/**
 已转化为对应的字符串
 */
@property (nonatomic, strong) NSString *beginDateString;
@property (nonatomic, strong) NSString *endDateString;

/**
 工作内容
 */
@property (nonatomic, strong) NSString *workContent;

/**
 工作成绩
 */
@property (nonatomic, strong) NSString *achievement;

/**
 是否对此公司隐藏
 */
@property (nonatomic, assign) BOOL hasHide;
@end

@interface FJUserProject: FJBaseObject

/**
 id
 */
@property (nonatomic, strong) NSString *projectId;

/**
 项目名称
 */
@property (nonatomic, strong) NSString *projectName;

/**
 本人角色名
 */
@property (nonatomic, strong) NSString *roleName;

/**
 开始时间{YYYY-MM-DD}（获取为时间戳，提交为格式化的字符串）
 */
@property (nonatomic, strong) NSDate *beginDate;

/**
 结束时间
 {YYYY-MM-DD}
 */
@property (nonatomic, strong) NSDate *endDate;

/**
 已转化为对应的字符串
 */
@property (nonatomic, strong) NSString *beginDateString;
@property (nonatomic, strong) NSString *endDateString;

/**
 项目描述
 */
@property (nonatomic, strong) NSString *projectDesc;
@end

@interface FJUser : FJBaseObject

/**
 用户id
 */
@property (nonatomic, strong) NSString *userId;

/**
 毕业时间{YYYY-MM-DD}
 */
@property (nonatomic, strong) NSDate *graduationTime;

/**
 毕业时间{YYYY-MM-DD}
 */
@property (nonatomic, strong) NSString *graduationTimeString;

/**
 姓名
 */
@property (nonatomic, strong) NSString *realName;

/**
 手机号
 */
@property (nonatomic, strong) NSString *phone;

/**
 性别{MALE,FEMAL}
 */
@property (nonatomic, strong) NSString *sex;

/**
 出生年月
 */
@property (nonatomic, strong) NSString *birthday;

/**
 学校
 */
@property (nonatomic, strong) NSString *school;

/**
 专业
 */
@property (nonatomic, strong) NSString *profession;

/**
 学历{数据字典}
 */
@property (nonatomic, strong) NSString *education;

/**
 行业意向{数据字典}
 */
@property (nonatomic, strong) NSString *industryTypes;

/**
 期望薪资{数据字典}
 */
@property (nonatomic, strong) NSString *incomeLevel;

/**
 首次工作日期{YYYY-MM-DD}
 */
@property (nonatomic, strong) NSDate *firstWorkTime;

/**
 首次工作日期{YYYY-MM-DD}
 */
@property (nonatomic, strong) NSString *firstWorkTimeString;

/**
 简介
 */
@property (nonatomic, strong) NSString *des;


//========================= 创建 ============================
@property (nonatomic, strong) FJUserEdu *userEdu;
@property (nonatomic, strong) FJUserWork *userWork;
@property (nonatomic, strong) FJUserProject *userProject;
//======================== 读取 =========================
@property (nonatomic, strong) NSArray *educationList;
@property (nonatomic, strong) NSArray *companyList;
@property (nonatomic, strong) NSArray *projectList;

/**
 构建

 @param type type description
 @return return value description
 */
- (instancetype)initWithType:(UserInitType)type;
@end
