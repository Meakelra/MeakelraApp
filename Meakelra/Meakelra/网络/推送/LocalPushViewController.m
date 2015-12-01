//
//  LocalPushViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/12/1.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "LocalPushViewController.h"

@interface LocalPushViewController ()

@end

@implementation LocalPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"本地推送";
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(20, 100, [[UIScreen mainScreen] bounds].size.width - 40, 30);
    button.backgroundColor = [UIColor cyanColor];
    [button setTitle:@"发送本地通知" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    

}

- (void)buttonClick:(UIButton *)button{
    //发送本地通知
    UILocalNotification *notification=[[UILocalNotification alloc]init];
    //创建时间
    NSDate *date=[NSDate new];
    //设置调用本地通知的时间为启动后10S
    notification.fireDate=[date dateByAddingTimeInterval:10];
    //设置时间的时区
    notification.timeZone=[NSTimeZone defaultTimeZone];
    //设置本地通知的参数
    notification.alertBody=@"Hello World";
    
    
    //调用本地通知
    [[UIApplication sharedApplication]scheduleLocalNotification:notification];

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
