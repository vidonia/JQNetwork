//
//  JQViewController.m
//  JQNetwork
//
//  Created by vidonia on 10/21/2021.
//  Copyright (c) 2021 vidonia. All rights reserved.
//

#import "JQViewController.h"
#import "JQNetworkRequest.h"
#import "JQRequestManager.h"
#import "JQNetworkResponse.h"

@interface JQViewController ()

@end

@implementation JQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)getRequest:(id)sender {
    JQNetworkRequest *request = [[JQNetworkRequest alloc] init];
    NSURLRequest *urlReq = [request GETMethodWithParams:@{@"unionId":@"29"} baseURL:@"https://route-uat.yuantutech.com/" path:@"/user-web/restapi/common/personalCenter/all" headers:nil];
    [[JQRequestManager manager] request:urlReq success:^(JQNetworkResponse * _Nonnull response) {
        NSLog(@"%@", response.content);
    } fail:^(JQNetworkResponse * _Nonnull response) {
        NSLog(@"%@", response.errorMessage);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
