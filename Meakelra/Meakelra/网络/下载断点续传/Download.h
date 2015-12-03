//
//  Download.h
//  Meakelra
//
//  Created by 潘颖超 on 15/12/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//typedef

//遵循协议NSURLConnectionDataDelegate数据相关
@interface Download : NSObject <NSURLConnectionDataDelegate>
{
    
}

//定义Block，用于回传下载的进度
//循环引用
//value  下载的进度
@property (nonatomic, strong) void(^progressBlock)(float value);

//重载初始化方法
- (instancetype)initWithURL:(NSString *)urlString;

//发起网络请求
- (void)start;

//停止网路请求
- (void)stop;


@end
