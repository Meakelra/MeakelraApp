//
//  ConnectionViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/12/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ConnectionViewController.h"
#import "Download.h"

@interface ConnectionViewController (){
    Download *_download;
}


@property (nonatomic, strong) UIProgressView *pro;
@property (nonatomic, strong) UIImageView    *imageView;

@end

@implementation ConnectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageView=[[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 200, 200)];
    
    [self.view addSubview:_imageView];
    
    _pro=[[UIProgressView alloc] initWithFrame:CGRectMake(20, _imageView.frame.origin.y+220, [[UIScreen mainScreen] bounds].size.width - 40, 2)];
    [self.view addSubview:_pro];
    
    UIButton * button=[[UIButton alloc] initWithFrame:CGRectMake(50, _imageView.frame.origin.y+200+20, 50, 40)];
    button.backgroundColor=[UIColor blueColor];
    [button setTitle:@"开始" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(ddLoad) forControlEvents:UIControlEventTouchUpInside];
    button.layer.borderWidth=1;
    button.layer.borderColor=[UIColor blueColor].CGColor;
    button.layer.cornerRadius=5;
    [self.view addSubview:button];
    
    UIButton * button1=[[UIButton alloc] initWithFrame:CGRectMake(50 + 60, _imageView.frame.origin.y+200+20, 50, 40)];
    button1.backgroundColor=[UIColor blueColor];
    [button1 setTitle:@"暂停" forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(pause) forControlEvents:UIControlEventTouchUpInside];
    button1.layer.borderWidth=1;
    button1.layer.borderColor=[UIColor blueColor].CGColor;
    button1.layer.cornerRadius=5;
    [self.view addSubview:button1];
    
    
    //初始化下载类，传入url
    _download = [[Download alloc] initWithURL:@"http://10.0.8.8/download/softwares/xcode/56841_xcode_6.1.dmg"];
    
    //定义一个ViewController对象将self赋值给他，使用weak修饰
    __weak ConnectionViewController *mySelf = self;
    
    _download.progressBlock = ^(float value){
        //刷新progressView的进度
        mySelf.pro.progress = value;
    };

}

- (void)ddLoad{
    //调用开始下载
    [_download start];
}
- (void)pause{
    //调用停止下载
    [_download stop];
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
