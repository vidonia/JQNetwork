//
//  JQNetworkResponse.h
//  JQNetwork
//
//  Created by jiaqian wang on 2021/11/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JQNetworkResponseStatus) {
    JQNetworkResponseStatusSuccess = 0, //作为底层，请求是否成功只考虑是否成功收到服务器反馈。至于签名是否正确，返回的数据是否完整，由上层的来决定。
    JQNetworkResponseStatusErrorTimeout,
    JQNetworkResponseStatusErrorCancel,
    JQNetworkResponseStatusErrorNoNetwork // 默认除了超时以外的错误都是无网络错误。
};


@interface JQNetworkResponse : NSObject

/// 接口返回的数据原始 dict 格式
@property (nonatomic, copy, readonly) id content;

/// 请求 request
@property (nonatomic, copy, readonly) NSURLRequest *request;

/// 错误信息
@property (nonatomic, copy, readonly) NSString *errorMessage;

/// 请求结果状态
@property (nonatomic, assign, readonly) JQNetworkResponseStatus status;

/// 请求ID
@property (nonatomic, assign, readonly) NSInteger requestId;

@property (nonatomic, assign, readonly) BOOL isCache;

/// 初始化 Response
/// @param responseObject 请求结果原始格式（nsdata或json）
/// @param requestId 请求ID
/// @param request 请求 request
/// @param error 错误
- (instancetype)initWithResponseObject:(id)responseObject requestId:(NSNumber *)requestId request:(NSURLRequest *)request error:(nullable NSError *)error;

- (instancetype)initWithData:(id)data;

@end

NS_ASSUME_NONNULL_END
