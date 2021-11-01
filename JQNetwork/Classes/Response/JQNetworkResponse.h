//
//  JQNetworkResponse.h
//  JQNetwork
//
//  Created by jiaqian wang on 2021/11/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JQNetworkResponseStatus) {
    JQNetworkResponseStatusSuccess = 0, //作为底层，请求是否成功只考虑是否成功收到服务器反馈。至于签名是否正确，返回的数据是否完整，由上层的CTAPIBaseManager来决定。
    JQNetworkResponseStatusErrorTimeout,
    JQNetworkResponseStatusErrorCancel,
    JQNetworkResponseStatusErrorNoNetwork // 默认除了超时以外的错误都是无网络错误。
};


@interface JQNetworkResponse : NSObject

@property (nonatomic, copy, readonly) id content;
@property (nonatomic, copy, readonly) NSURLRequest *request;
@property (nonatomic, copy, readonly) NSString *errorMessage;
@property (nonatomic, assign, readonly) JQNetworkResponseStatus status;
@property (nonatomic, assign, readonly) NSInteger requestId;

- (instancetype)initWithResponseObject:(id)responseObject requestId:(NSNumber *)requestId request:(NSURLRequest *)request error:(nullable NSError *)error;

@end

NS_ASSUME_NONNULL_END
