//
//  server.h
//  Job
//
//  Created by 小黑胖 on 2018/10/6.
//  Copyright © 2018年 lxw. All rights reserved.
//

#ifndef server_h
#define server_h
#define Debug 1

#if Debug
#define serverDomain            @"https://api.windwalker.club"
#else
#define serverDomain            @"https://app.fitflow.io"
#endif

#define URLForge(tail)            URLCombine(serverDomain,tail)
#define URLCombine(serverDomain,tail)   [NSString stringWithFormat:@"%@%@",serverDomain,tail]


#endif /* server_h */
