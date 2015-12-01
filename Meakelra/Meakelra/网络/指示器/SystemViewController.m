//
//  SystemViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/12/1.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "SystemViewController.h"

@interface SystemViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *activity;

@property (nonatomic, strong) UIView                  *backView;
@property (nonatomic, strong) UIActivityIndicatorView *activityView;

@end

@implementation SystemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    _activity = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activity.center = self.view.center;
    [self.view addSubview:_activity];
    
    [_activity startAnimating];
    
    _backView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 100, 100)];
    _backView.backgroundColor = [UIColor lightGrayColor];
    _backView.layer.cornerRadius = 10;
    [self.view addSubview:_backView];
    
    NSLog(@"%@",NSStringFromCGPoint(_backView.center));
    
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    _activityView.center = CGPointMake(_backView.center.x - 20, _backView.center.y - 100);
    [_backView addSubview:_activityView];
    
    [_activityView startAnimating];


    
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_activity stopAnimating];
    
    _backView = nil;
    _activityView = nil;
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
