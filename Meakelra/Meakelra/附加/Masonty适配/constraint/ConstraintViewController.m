//
//  ConstraintViewController.m
//  AV
//
//  Created by 潘颖超 on 15/11/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ConstraintViewController.h"

@interface ConstraintViewController ()

@end

@implementation ConstraintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Constraint";
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-10);
        make.top.equalTo(self.view).offset(74);
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        
    }];
    
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(100, 100));
        make.center.mas_equalTo(CGPointMake(-100, 0));
    }];
    
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
