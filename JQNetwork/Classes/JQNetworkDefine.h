//
//  JQNetworkDefine.h
//  JQNetwork
//
//  Created by jiaqian wang on 2021/11/1.
//

#ifndef JQNetworkDefine_h
#define JQNetworkDefine_h

typedef NS_ENUM (NSUInteger, JQNetworkEnvironment) { // 当前使用环境
    JQNetworkEnvironmentProduction = 0, // 生产环境
    JQNetworkEnvironmentTest, // 测试环境
    JQNetworkEnvironmentPre_production, // 灰度
};

typedef NS_ENUM (NSUInteger, JQNetworkRequestType) { // 请求方式
    JQNetworkRequestTypeGet = 0,
    JQNetworkRequestTypePost,
    JQNetworkRequestTypeUpload,
};


#endif /* JQNetworkDefine_h */
