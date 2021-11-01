//
//  JQNetworkResponse.h
//  JQNetwork
//
//  Created by jiaqian wang on 2021/11/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JQNetworkResponse : NSObject
- (instancetype)initWithResponseObject:(id)responseObject requestId:(NSNumber *)requestId request:(NSURLRequest *)request error:(NSError *)error;
@end

NS_ASSUME_NONNULL_END
