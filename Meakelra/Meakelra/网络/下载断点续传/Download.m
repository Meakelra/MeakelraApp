//
//  Download.m
//  Meakelra
//
//  Created by 潘颖超 on 15/12/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "Download.h"

@implementation Download
{
    //设置全局变量
    NSString *_myURL;
    
    //定义connection对象
    NSURLConnection *_connection;
    
    //已下载文件大小
    unsigned long long _currentLenght;
    
    //待下载的全部文件大小
    long long _totalLenght;
    
    //全局
    NSFileHandle *_fileHandle;
}

//初始化方法实现
//instancetype相对于id有类型判断功能（初始化方法一般都是用instancetype）
- (instancetype)initWithURL:(NSString *)urlString
{
    //super消息的接受体是本类对象，但是检索的方法列表是父类方法列表
    //（系统保留字）
    if (self = [super init]) {
        //自定义操作
        _myURL = urlString;
        
        //调用私有方法，发起网路请求
        [self createConnection];
        
    }
    return self;
}

//创建NSURLConnection对象发起网路请求
//私有方法
- (void)createConnection
{
    //URLWithString:默认要跟网络协议（Http）
    //fileURLWithPath:
    NSURL *url = [NSURL URLWithString:_myURL];
    //创建Request
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSString *path = [NSString stringWithFormat:@"%@/Documents/download.dmg", NSHomeDirectory()];
    NSLog(@"%@", path);
    //可读写
    _fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:path];
    
    //创建fileManager
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:path]) {
        //存在文件   读取文件，计算已下载内容大小
        _currentLenght = [_fileHandle seekToEndOfFile];
        
    }else{
        //不存在文件   创建文件
        [fileManager createFileAtPath:path contents:nil attributes:nil];
        _currentLenght = 0;
    }
    
    //设置请求头信息  range
    //setValue:forHTTPHeaderField:  设置报头信息
    //setHTTPBody:  设置post参数
    //告诉服务器，从某个位置开始下载，一直下载到文件的末尾
    [request setValue:[NSString stringWithFormat:@"bytes=%llu-", _currentLenght] forHTTPHeaderField:@"Range"];
    
    //初始化
    _connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    
}

//start方法实现
- (void)start
{
    if (_connection == nil) {
        //如果为空，先创建
        [self createConnection];
        //再开启下载
        [_connection start];
    }else{
        [_connection start];
    }
    
}
//stop方法实现
- (void)stop
{
    //取消下载任务
    [_connection cancel];
    //赋空  操作系统收回内存
    _connection = nil;
}


#pragma mark 协议方法实现
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    //200  206  code
    //通过返回头信息，取得下载文件的总长度(当前)
    _totalLenght = response.expectedContentLength + _currentLenght;
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //计算当前下载文件的大小
    _currentLenght += [data length];
    //计算进度比例
    float value = (float)_currentLenght / (float)_totalLenght;
    NSLog(@"%f   %llu  %llu", value, _currentLenght, _totalLenght);
    //调用Block传值
    self.progressBlock(value);
    
    //每次返回数据，直接写入本地文件
    [_fileHandle writeData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"下载完成" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alertView show];
}



@end
