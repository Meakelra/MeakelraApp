//
//  ReachabilityCheckViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/12/1.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ReachabilityCheckViewController.h"
#import "Reachability.h"

@interface ReachabilityCheckViewController ()

@property (nonatomic, strong) Reachability *conn;

@property (nonatomic, strong) Reachability *hostReach;


@property (nonatomic, strong) Reachability *wifiReach;


@end

@implementation ReachabilityCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 监听网络状态改变的通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(networkStateChange) name:kReachabilityChangedNotification object:nil];
    
    // 创建Reachability
    self.conn = [Reachability reachabilityWithHostname:@"http://www.baidu.com"];
    // 开始监控网络(一旦网络状态发生改变, 就会发出通知kReachabilityChangedNotification)
    [self.conn startNotifier];
    
}

// 处理网络状态改变
- (void)networkStateChange
{
    // 1.检测wifi状态
    Reachability *wifi = [Reachability reachabilityForLocalWiFi];
    
    // 2.检测手机是否能上网络(WIFI\3G\2.5G)
    Reachability *conn = [Reachability reachabilityForInternetConnection];
    
    // 3.判断网络状态
    if ([wifi currentReachabilityStatus] != NotReachable) { // 有wifi
        NSLog(@"有wifi");
    } else if ([conn currentReachabilityStatus] != NotReachable) { // 没有使用wifi, 使用手机自带网络进行上网
        NSLog(@"使用手机自带网络进行上网");
    } else { // 没有网络
        NSLog(@"没有网络");
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
