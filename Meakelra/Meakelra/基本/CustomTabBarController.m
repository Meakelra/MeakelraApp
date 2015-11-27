//
//  CustomTabBarController.m
//  test
//
//  Created by 潘颖超 on 15/11/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "CustomTabBarController.h"
#import "LocalViewController.h"
#import "HttpViewController.h"
#import "AdditionViewController.h"

@interface CustomTabBarController ()

@end

@implementation CustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    LocalViewController    *local = [[LocalViewController alloc] init];
    HttpViewController     *http = [[HttpViewController alloc] init];
    AdditionViewController *addition = [[AdditionViewController alloc] init];
    
    NSArray *array = @[local, http, addition];
    NSArray *title = @[@"本地", @"网络", @"附加"];
    
    NSMutableArray *controllers = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < array.count; i ++) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:array[i]];
        nav.tabBarItem.title = title[i];
        [controllers addObject:nav];
    }
    
    self.viewControllers = controllers;
    
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
