//
//  LabelViewController.m
//  AV
//
//  Created by 潘颖超 on 15/11/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "LabelViewController.h"

@interface LabelViewController ()

@end

@implementation LabelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Label";
    
    UILabel *longLable=[[UILabel alloc]initWithFrame:CGRectMake(10, 100, 280, 30)];
    longLable.numberOfLines=0;
    longLable.textColor=[UIColor redColor];
    longLable.backgroundColor = [UIColor grayColor];
    longLable.text=@"Do any additional setup after loading the view.Do any additional setup after loading the view.Do any additional setup after loading the view.Do any additional setup after loading the view.Do any additional setup after loading the view.Do any additional setup after loading the view.Do any additional setup after loading the view.Do any additional setup after loading the view.";
    [self.view addSubview:longLable];
    
    [longLable mas_makeConstraints:^(MASConstraintMaker *make) {
        UIEdgeInsets insets = UIEdgeInsetsMake(80, 20, 50, 20);
        make.top.equalTo(self.view.mas_top).insets(insets);
        make.left.equalTo(self.view.mas_left).insets(insets);
        //label自适应高度，不用考虑下边距
//        make.bottom.equalTo(self.view.mas_bottom).insets(insets);
        make.right.equalTo(self.view.mas_right).insets(insets);
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
