//
//  JQRequestManager.h
//  JQNetwork
//
//  Created by jiaqian wang on 2021/11/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class JQNetworkResponse;
@class AFHTTPSessionManager;

typedef void(^JQRequestCallback)(JQNetworkResponse *response);

@interface JQRequestManager : NSObject

+ (instancetype)manager;

/// 发起请求
/// @param request 请求
/// @param success 成功回调
/// @param fail 失败回调
- (NSNumber *)request:(NSURLRequest *)request success:(JQRequestCallback)success fail:(JQRequestCallback)fail;

/// 发起请求（自建 AFHTTPSessionManager）
/// @param request 请求
/// @param sessionManager 本次请求使用外部创建的 AFHTTPSessionManager 发起请求
/// @param success 成功回调
/// @param fail 失败回调
- (NSNumber *)request:(NSURLRequest *)request sessionManager:(AFHTTPSessionManager *)sessionManager success:(JQRequestCallback)success fail:(JQRequestCallback)fail;

/// 取消请求
/// @param requestID 请求ID
- (void)cancelRequestWithRequestID:(NSNumber *)requestID;

/// 取消请求
/// @param requestIDList 存放请求ID 列表
- (void)cancelRequestWithRequestIDList:(NSArray<NSNumber *> *)requestIDList;


@end

NS_ASSUME_NONNULL_END
