//
//  ApplicableViewController.m
//  test
//
//  Created by 潘颖超 on 15/11/26.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ApplicableViewController.h"

@interface ApplicableViewController ()

@end

@implementation ApplicableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"iOS9适配";
    
    //因内容较散，调用网页加载
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 64)];
    NSURL *url = [NSURL URLWithString:@"http://www.cnblogs.com/dsxniubility/p/4821184.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:webView];
    
    
    self.tableView = nil;
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
