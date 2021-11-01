# JQNetwork

[![CI Status](https://img.shields.io/travis/vidonia/JQNetwork.svg?style=flat)](https://travis-ci.org/vidonia/JQNetwork)
[![Version](https://img.shields.io/cocoapods/v/JQNetwork.svg?style=flat)](https://cocoapods.org/pods/JQNetwork)
[![License](https://img.shields.io/cocoapods/l/JQNetwork.svg?style=flat)](https://cocoapods.org/pods/JQNetwork)
[![Platform](https://img.shields.io/cocoapods/p/JQNetwork.svg?style=flat)](https://cocoapods.org/pods/JQNetwork)

## Example

```objc
    JQNetworkRequest *request = [[JQNetworkRequest alloc] init];
    NSURLRequest *urlReq = [request GETMethodWithParams:@{@"unionId":@"29"} baseURL:@"https://aaaa.bbbb.com/" path:@"/user-web/restapi/common/xxxxx" headers:nil];
    [[JQRequestManager manager] request:urlReq success:^(JQNetworkResponse * _Nonnull response) {
        NSLog(@"%@", response.content);
    } fail:^(JQNetworkResponse * _Nonnull response) {
        NSLog(@"%@", response.errorMessage);
    }];
```

## Requirements

## Installation

JQNetwork is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JQNetwork'
```

## Author

vidonia, wangjiaqian93@gmail.com

## License

JQNetwork is available under the MIT license. See the LICENSE file for more info.
