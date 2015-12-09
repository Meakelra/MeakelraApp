//
//  SizeViewController.m
//  AV
//
//  Created by 潘颖超 on 15/11/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "SizeViewController.h"

@interface SizeViewController ()

@end

@implementation SizeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Size";
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 64)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    for (int i = 0; i < 20; i ++) {
        UIView *vv = [[UIView alloc] init];
        vv.backgroundColor=[UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];
        [view addSubview:vv];
        
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            UIEdgeInsets insets = UIEdgeInsetsMake(5, 5, 5, 5);
            make.edges.equalTo(view).insets(insets);
        }];
        view = vv;
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
