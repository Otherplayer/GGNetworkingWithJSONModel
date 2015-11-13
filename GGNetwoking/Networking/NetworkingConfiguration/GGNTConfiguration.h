//
//  GGNTConfiguration.h
//  GGNetwoking
//
//  Created by __无邪_ on 15/8/27.
//  Copyright (c) 2015年 __无邪_. All rights reserved.
//

#ifndef GGNetwoking_GGNTConfiguration_h
#define GGNetwoking_GGNTConfiguration_h

#define SHOULD_USE_JSONMODEL   /*是否调用JSONModel*/
#import "GGBASEModel.h"

//////////////////////////////////////
#ifdef DEBUG
//#define IS_OFF_LINE
#endif
//////////////////////////////////////


#ifdef IS_OFF_LINE
#define HOTYQ_JAVA_API @"https://121.201.63.217:8089/api/0107/"
#else
#define HOTYQ_JAVA_API @"https://www.hotyq.com:8099/api/0107/"          //线上接口
#endif


static NSTimeInterval GGNetworkTimeoutInterval   = 60;    // 超时时间
static NSTimeInterval kGGCacheOutdateTimeSeconds = 300;   // 5分钟的cache过期时间
static NSUInteger     kGGCacheCountLimit         = 1000;  // 最多1000条cache
static NSUInteger     kGGDiskCacheCapacityLimitM = 500;   // 最大本地缓存容量 500 M

typedef NS_ENUM(NSInteger, GGResponseErrCodeType){
    GGURLResponseStatusSuccess = 1000,        //请求是否成功只考虑是否成功收到服务器反馈。
    GGURLResponseStatusErrorTimeout = 10001,  //请求超时
    GGURLResponseStatusErrorNoNetwork = 10002 //除了超时以外的错误都是网络错误。
};


#ifdef SHOULD_USE_JSONMODEL
typedef void (^GGRequestCallbackBlock)(BOOL success, GGBASEModel *responseData);
#else
typedef void (^GGRequestCallbackBlock)(BOOL success, id responseData);
#endif
typedef void (^GGNetNotReachabilityBlock)();


#endif
