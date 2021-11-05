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

/// GET 请求
/// @param params 入参
/// @param baseURL HOST
/// @param path 接口路径
/// @param headers 头部参数
- (NSURLRequest *)GETMethodWithParams:(nullable NSDictionary *)params baseURL:(NSString *)baseURL path:(NSString *)path headers:(nullable NSDictionary *)headers;

/// POST 请求
/// @param params 入参
/// @param baseURL HOST
/// @param path 接口路径
/// @param headers 头部参数
- (NSURLRequest *)POSTMethodWithParams:(nullable NSDictionary *)params baseURL:(NSString *)baseURL path:(NSString *)path headers:(nullable NSDictionary *)headers;

/// 上传
/// @param params 入参
/// @param uploadParams 上传文件（key:fileName:文件名称&后端参数名，value：文件路径）
/// @param baseURL HOST
/// @param path 接口路径
/// @param headers 头部参数
/// @param mimeType 文件类型 ，@"image/png"
- (NSURLRequest *)uploadRequestWithParams:(nullable NSDictionary *)params uploadParams:(NSDictionary *)uploadParams baseURL:(NSString *)baseURL path:(NSString *)path headers:(nullable NSDictionary *)headers mimeType:(NSString *)mimeType;

+ (NSString *)handleUrl:(NSString *)baseURL path:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
