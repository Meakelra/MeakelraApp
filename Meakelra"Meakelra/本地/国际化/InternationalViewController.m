//
//  InternationalViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/11/27.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "InternationalViewController.h"

@interface InternationalViewController ()

@end

@implementation InternationalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"国际化";
    
    //获取国际化文字
    NSLog(@"%@",NSLocalizedString(@"language", @""));
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(20, 100, 250, 60);
    label.text = NSLocalizedString(@"language", @"");
    [self.view addSubview:label];

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
