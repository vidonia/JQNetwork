//
//  JQNetworkDefine.h
//  JQNetwork
//
//  Created by jiaqian wang on 2021/11/1.
//

#ifndef JQNetworkDefine_h
#define JQNetworkDefine_h

typedef NS_ENUM (NSUInteger, JQNetworkEnvironment) {
    JQNetworkEnvironmentProduction = 0, // 生产环境
    JQNetworkEnvironmentTest, // 测试环境
    JQNetworkEnvironmentPre_production, // 灰度
};

typedef NS_ENUM (NSUInteger, JQNetworkRequestType) {
    JQNetworkRequestTypeGet = 0,
    JQNetworkRequestTypePost,
    JQNetworkRequestTypeUpload,
};


typedef NS_OPTIONS(NSUInteger, JQNetworkCachePolicy) {
    JQNetworkCachePolicyNoCache = 0,
    JQNetworkCachePolicyMemory = 1 << 0,
    JQNetworkCachePolicyDisk = 1 << 1,
};

#endif /* JQNetworkDefine_h */
