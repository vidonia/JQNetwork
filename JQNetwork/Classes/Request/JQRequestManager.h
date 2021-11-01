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

- (NSNumber *)request:(NSURLRequest *)request success:(JQRequestCallback)success fail:(JQRequestCallback)fail;
- (NSNumber *)request:(NSURLRequest *)request sessionManager:(AFHTTPSessionManager *)sessionManager success:(JQRequestCallback)success fail:(JQRequestCallback)fail;
- (void)cancelRequestWithRequestID:(NSNumber *)requestID;
- (void)cancelRequestWithRequestIDList:(NSArray<NSNumber *> *)requestIDList;


@end

NS_ASSUME_NONNULL_END
