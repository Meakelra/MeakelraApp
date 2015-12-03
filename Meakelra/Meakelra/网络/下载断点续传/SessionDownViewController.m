//
//  SessionDownViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/12/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "SessionDownViewController.h"

@interface SessionDownViewController ()<NSURLSessionDownloadDelegate>{
    NSURLSessionDownloadTask *_task;
    NSData                   *_data;
    NSURLSession             *_session;
    NSURLRequest             *_request;
    UIProgressView           *_pro;
    UIImageView              *_imageView;
}

@end

@implementation SessionDownViewController

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
    
    UIButton * button2=[[UIButton alloc] initWithFrame:CGRectMake(50 + 120, _imageView.frame.origin.y+200+20, 50, 40)];
    button2.backgroundColor=[UIColor blueColor];
    [button2 setTitle:@"恢复" forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(resume) forControlEvents:UIControlEventTouchUpInside];
    button2.layer.borderWidth=1;
    button2.layer.borderColor=[UIColor blueColor].CGColor;
    button2.layer.cornerRadius=5;
    [self.view addSubview:button2];
}

- (void) ddLoad{
    NSURLSessionConfiguration * config=[NSURLSessionConfiguration defaultSessionConfiguration];
    _session=[NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    //
    NSURL *url=[NSURL URLWithString:@"http://img2.3lian.com/img2007/19/33/005.jpg"];
    _request=[NSURLRequest requestWithURL:url];
    _task= [_session downloadTaskWithRequest:_request];
    
    NSLog(@"开始加载");
    [_task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) pause{
    //暂停
    NSLog(@"暂停下载");
    [_task cancelByProducingResumeData:^(NSData *resumeData) {
        _data=resumeData;
    }];
    _task=nil;
    
}
- (void) resume{
    //恢复
    NSLog(@"恢复下载");
    if(!_data){
        NSURL *url=[NSURL URLWithString:@"http://img2.3lian.com/img2007/19/33/005.jpg"];
        _request=[NSURLRequest requestWithURL:url];
        _task=[_session downloadTaskWithRequest:_request];
        
    }else{
        _task=[_session downloadTaskWithResumeData:_data];
    }
    [_task resume];
}

#pragma mark - delegate
- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location{
    
    NSURL * url=[NSURL fileURLWithPath:@"/Users/Meakelra/Desktop/tt.jpg"];
    
    NSFileManager * manager=[NSFileManager defaultManager];
    
    [manager moveItemAtURL:location toURL:url error:nil];
    dispatch_async(dispatch_get_main_queue(), ^{
        
        NSData * data=[manager contentsAtPath:@"/Users/Meakelra/Desktop/tt.jpg"];
        UIImage * image=[[UIImage alloc ]initWithData:data];
        _imageView.image=image;
        UIAlertView * alert=[[UIAlertView alloc] initWithTitle:nil message:@"下载完成" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
        
    }) ;
}

- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask
      didWriteData:(int64_t)bytesWritten
 totalBytesWritten:(int64_t)totalBytesWritten
totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    CGFloat progress=(totalBytesWritten*1.0)/totalBytesExpectedToWrite;
    dispatch_async(dispatch_get_main_queue(), ^{
        _pro.progress=progress;
    }) ;
    
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
