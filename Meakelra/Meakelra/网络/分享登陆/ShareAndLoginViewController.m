//
//  ShareAndLoginViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/12/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ShareAndLoginViewController.h"

@interface ShareAndLoginViewController ()<UIAlertViewDelegate>

@end

@implementation ShareAndLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"13" message:@"456" delegate:self cancelButtonTitle:@"cancle" otherButtonTitles:@"OK", nil];
    
    [alert show];
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
