//
//  HttpViewController.m
//  test
//
//  Created by 潘颖超 on 15/11/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "HttpViewController.h"

@interface HttpViewController ()

@end

@implementation HttpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"网络";
    
    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"下载断点续传", @"本地推送和远程推送", @"第三方分享和登录 OAuth2.0实现", @"软件更新检查", @"网络状态检查", @"POST上传下载", @"加载指示器", @"动态计算cell的高度", @"性能优化（内存，加载速度等）", @"Mantle或者JsonModel"]];
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
