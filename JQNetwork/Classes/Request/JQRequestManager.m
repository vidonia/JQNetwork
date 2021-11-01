//
//  JQRequestManager.m
//  JQNetwork
//
//  Created by jiaqian wang on 2021/11/1.
//

#import "JQRequestManager.h"
#import "AFHTTPSessionManager.h"
#import "JQNetworkResponse.h"

@interface JQRequestManager ()

@property (nonatomic, strong) NSMutableDictionary *taskTable;
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;

@end

@implementation JQRequestManager

+ (instancetype)manager {
    static dispatch_once_t onceToken;
    static JQRequestManager *manager;
    dispatch_once(&onceToken, ^{
        manager = [JQRequestManager new];
    });
    return manager;
}

#pragma mark - Request

- (NSNumber *)request:(NSURLRequest *)request success:(JQRequestCallback)success fail:(JQRequestCallback)fail {
    return [self request:request sessionManager:self.sessionManager success:success fail:fail];
}

- (NSNumber *)request:(NSURLRequest *)request sessionManager:(AFHTTPSessionManager *)sessionManager success:(JQRequestCallback)success fail:(JQRequestCallback)fail {
    __block NSURLSessionDataTask *dataTask = [sessionManager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil completionHandler:^(NSURLResponse * _Nonnull responseObj, id  _Nullable responseObject, NSError * _Nullable error) {
        NSNumber *requestId = @([dataTask taskIdentifier]);
        [self.taskTable removeObjectForKey:requestId];
        
        JQNetworkResponse *response = [[JQNetworkResponse alloc] initWithResponseObject:responseObj requestId:requestId request:request error:error];
        
        if (error) {
            fail?fail(response):nil;
        } else {
            success?success(response):nil;
        }
        
    }];
    
    NSNumber *requestId = @([dataTask taskIdentifier]);
    
    self.taskTable[requestId] = dataTask;
    [dataTask resume];
    
    return requestId;
}

#pragma mark - Cancel

- (void)cancelRequestWithRequestID:(NSNumber *)requestID {
    if (requestID == nil) {
        return;
    }
    NSURLSessionDataTask *task = [self.taskTable objectForKey:requestID];
    [task cancel];
}

- (void)cancelRequestWithRequestIDList:(NSArray<NSNumber *> *)requestIDList {
    for (NSNumber *requestID in requestIDList) {
        NSURLSessionDataTask *task = [self.taskTable objectForKey:requestID];
        [task cancel];
    }
}

#pragma mark - LazyLoad

- (NSMutableDictionary *)taskTable {
    if (!_taskTable) {
        _taskTable = [NSMutableDictionary dictionary];
    }
    return _taskTable;
}

- (AFHTTPSessionManager *)sessionManager {
    if (!_sessionManager) {
        _sessionManager = [AFHTTPSessionManager manager];
    }
    return _sessionManager;
}

@end
