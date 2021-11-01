//
//  JQNetworkRequest.m
//  JQNetwork
//
//  Created by jiaqian wang on 2021/11/1.
//

#import "JQNetworkRequest.h"
#import "AFURLRequestSerialization.h"

@interface JQNetworkRequest ()

@end

@implementation JQNetworkRequest

- (NSURLRequest *)GETMethodWithParams:(NSDictionary *)params baseURL:(NSString *)baseURL path:(NSString *)path headers:(NSDictionary *)headers {
    return [self requestWithParams:params baseURL:baseURL path:path method:@"GET" headers:headers];
}

- (NSURLRequest *)POSTMethodWithParams:(NSDictionary *)params baseURL:(NSString *)baseURL path:(NSString *)path headers:(NSDictionary *)headers {
    return [self requestWithParams:params baseURL:baseURL path:path method:@"POST" headers:headers];
}

- (NSURLRequest *)requestWithParams:(NSDictionary *)params baseURL:(NSString *)baseURL path:(NSString *)path method:(NSString *)method headers:(NSDictionary *)headers {
    
    NSAssert(baseURL != nil, @"baseURL 不能为空！");
    NSAssert(path != nil, @"path 不能为空！");

    
    NSString *urlString = [self handleUrl:baseURL path:path];
    NSError *serializationError;

    NSMutableURLRequest *request = [self.httpSerializer requestWithMethod:method URLString:urlString parameters:params error:&serializationError];
    for (NSString *headerField in headers.keyEnumerator) {
        [request setValue:headers[headerField] forHTTPHeaderField:headerField];
    }
    
    if (serializationError) {
        return nil;
    }
    
    return request;

}

- (NSURLRequest *)uploadRequestWithParams:(NSDictionary *)params uploadParams:(NSDictionary *)uploadParams baseURL:(NSString *)baseURL path:(NSString *)path headers:(NSDictionary *)headers mimeType:(NSString *)mimeType {
    NSString *URLString = [self handleUrl:baseURL path:path];
    NSError *error;
    NSMutableURLRequest *request = [self.httpSerializer multipartFormRequestWithMethod:@"POST" URLString:URLString parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        for (NSString *fileName in [uploadParams allKeys]) {
            NSString *path = uploadParams[fileName];
            if (path != nil) {
                [formData appendPartWithFileURL:[NSURL URLWithString:path] name:fileName fileName:fileName mimeType:mimeType error:nil];
            }
        }
    } error:&error];
    
    for (NSString *headerField in headers.keyEnumerator) {
        [request setValue:headers[headerField] forHTTPHeaderField:headerField];
    }
    
    if (error) {
        return nil;
    }
    
    return request;
}

#pragma mark - Private Method

- (NSString *)handleUrl:(NSString *)baseURL path:(NSString *)path {
    NSURL *URL = [NSURL URLWithString:path relativeToURL:[NSURL URLWithString:baseURL]];
    NSString *urlString = [URL absoluteString];
    return urlString;
}

#pragma mark - LazyLoad

- (AFHTTPRequestSerializer *)httpSerializer {
    if (!_httpSerializer) {
        _httpSerializer = [AFHTTPRequestSerializer serializer];
    }
    return _httpSerializer;
}

@end
