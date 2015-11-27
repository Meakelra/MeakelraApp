//
//  MakeCodeViewController.m
//  test
//
//  Created by 潘颖超 on 15/11/25.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "MakeCodeViewController.h"
#import "QRCodeGenerator.h"

@interface MakeCodeViewController ()

@end

@implementation MakeCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"二维码的生成";
    
    //根视图
    //文本框
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 70, 200, 50)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"请输入文字";
    textField.tag = 1000;
    [self.view addSubview:textField];
    //按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(250, 70, 50, 50)];
    [button setTitle:@"生成" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.backgroundColor = [UIColor clearColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
}
//生成二维码
- (void)buttonClick{
    UITextField *textField = [self.view viewWithTag:1000];
    UIImage *image = [QRCodeGenerator qrImageForString:textField.text imageSize:200];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 120, 200, 200)];
    imageView.image = image ;
    [self.view addSubview:imageView];
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
