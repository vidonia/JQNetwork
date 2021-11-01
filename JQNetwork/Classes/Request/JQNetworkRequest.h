//
//  JQNetworkRequest.h
//  JQNetwork
//
//  Created by jiaqian wang on 2021/11/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class AFHTTPRequestSerializer;

@interface JQNetworkRequest : NSObject

@property (nonatomic, strong) AFHTTPRequestSerializer *httpSerializer;

- (NSURLRequest *)GETMethodWithParams:(nullable NSDictionary *)params baseURL:(NSString *)baseURL path:(NSString *)path headers:(nullable NSDictionary *)headers;
- (NSURLRequest *)POSTMethodWithParams:(nullable NSDictionary *)params baseURL:(NSString *)baseURL path:(NSString *)path headers:(nullable NSDictionary *)headers;
- (NSURLRequest *)uploadRequestWithParams:(nullable NSDictionary *)params uploadParams:(NSDictionary *)uploadParams baseURL:(NSString *)baseURL path:(NSString *)path headers:(nullable NSDictionary *)headers mimeType:(NSString *)mimeType;

@end

NS_ASSUME_NONNULL_END
