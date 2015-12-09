//
//  UpdateViewController.m
//  AV
//
//  Created by 潘颖超 on 15/11/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()

@property (nonatomic, assign) CGSize size;

@end

@implementation UpdateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Update";
    
    _size = CGSizeMake(100, 100);
    
    UIButton *button=[UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"ClickMe" forState:UIControlStateNormal];
    button.frame=CGRectMake(100, 100, self.size.width, self.size.height);
    button.layer.borderColor=[[UIColor blueColor]CGColor];
    button.layer.borderWidth=1;
    button.tag=100;
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonClick : (UIButton *)button{
    NSLog(@"aaa");
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];

    
    [UIView animateWithDuration:3 animations:^{
        //
        self.size = CGSizeMake(self.size.width * 1.3, self.size.height * 1.3);
        [self.view layoutIfNeeded];
    }];
    
}

- (void)updateViewConstraints {
    [super updateViewConstraints];
    UIButton *btn=(UIButton *)[self.view viewWithTag:100];
    [btn mas_updateConstraints:^(MASConstraintMaker *make) {
        //
        make.center.equalTo(self.view);
        make.width.equalTo(@(self.size.width)).priorityHigh();
        make.height.equalTo(@(self.size.height)).priorityLow();
        make.width.lessThanOrEqualTo(self.view);
        make.height.lessThanOrEqualTo(self.view);
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
