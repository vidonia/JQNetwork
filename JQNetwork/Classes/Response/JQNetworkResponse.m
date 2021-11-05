//
//  JQNetworkResponse.m
//  JQNetwork
//
//  Created by jiaqian wang on 2021/11/1.
//

#import "JQNetworkResponse.h"

@interface JQNetworkResponse ()

@property (nonatomic, copy, readwrite) id content;
@property (nonatomic, copy, readwrite) NSURLRequest *request;
@property (nonatomic, copy, readwrite) NSString *errorMessage;
@property (nonatomic, assign, readwrite) JQNetworkResponseStatus status;
@property (nonatomic, assign, readwrite) NSInteger requestId;
@property (nonatomic, assign, readwrite) BOOL isCache;

@end

@implementation JQNetworkResponse

- (instancetype)initWithResponseObject:(id)responseObject requestId:(NSNumber *)requestId request:(NSURLRequest *)request error:(NSError *)error {
    
    if (responseObject == nil && error == nil) {
        return nil;
    }
    
    self = [super init];
    
    if ([responseObject isKindOfClass:[NSData class]]) {
        self.content = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:NULL];
    } else {
        self.content = responseObject;
    }
    
    self.requestId = [requestId integerValue];
    self.request = request;
    self.status = [self responseStatusWithError:error];
    
    self.errorMessage = [NSString stringWithFormat:@"%@", error];
    
    return self;
}

- (instancetype)initWithData:(id)data {
    
    if (data == nil) {
        return nil;
    }

    self = [super init];
    
    if ([data isKindOfClass:[NSData class]]) {
        self.content = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    } else {
        self.content = data;
    }

    self.status = JQNetworkResponseStatusSuccess;
    
    self.isCache = YES;
    
    return self;
}

#pragma mark - Private Method

- (JQNetworkResponseStatus)responseStatusWithError:(NSError *)error {
    
    if (error) {
        
        JQNetworkResponseStatus result = JQNetworkResponseStatusErrorNoNetwork;
        
        // 除了超时以外，所有错误都当成是无网络
        if (error.code == NSURLErrorTimedOut) {
            result = JQNetworkResponseStatusErrorTimeout;
        }
        
        if (error.code == NSURLErrorCancelled) {
            result = JQNetworkResponseStatusErrorCancel;
        }
        
        if (error.code == NSURLErrorNotConnectedToInternet) {
            result = JQNetworkResponseStatusErrorNoNetwork;
        }
        
        return result;
        
    }
    
    return JQNetworkResponseStatusSuccess;
}

@end
