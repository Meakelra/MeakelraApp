//
//  AFDownViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/12/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "AFDownViewController.h"
#import <AFNetworking.h>
//导入头文件
//#import "AFHTTPRequestOperation.h"


@interface AFDownViewController ()

@end

@implementation AFDownViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /***********断点续传************/
    /*
    NSMutableURLRequest *request = [[NSMutableURLRequest  alloc] initWithURL:[NSURL URLWithString:@"http://localhost/1540/Xcode6.4.zip"]];
    
    NSString *path = [NSString stringWithFormat:@"%@/Documents/download.zip", NSHomeDirectory()];
    
    NSLog(@"%@", path);
    
    unsigned long long _currentLenght = 0;
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:path];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        _currentLenght = [fileHandle seekToEndOfFile];
    }
    
    //设置下载范围
    [request setValue:[NSString stringWithFormat:@"bytes=%llu-", _currentLenght] forHTTPHeaderField:@"Range"];
    
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    
    //下载文件直接以输出流的形式写入本地ROM
    [operation setOutputStream:[NSOutputStream outputStreamToFileAtPath:path append:YES]];
    
    //更新progressView
    [operation setDownloadProgressBlock:^(NSUInteger bytesRead, long long totalBytesRead, long long totalBytesExpectedToRead) {
        //代码
        float value = (float)(totalBytesRead + _currentLenght) / (totalBytesExpectedToRead + _currentLenght);
        
        NSLog(@"%f", value);
        
    }];
    
    //设置完成时回调
    [operation setCompletionBlock:^{
        //下载完成了
        //弹出一个alertview
        NSLog(@"下载完成！");
    }];
    
    
    //    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
    //    code
    //} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    //    code
    //}]
    
    //开启下载
    [operation start];
     */

    
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
