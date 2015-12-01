//
//  UpdataViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/11/30.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "UpdataViewController.h"

@interface UpdataViewController ()<UIAlertViewDelegate, NSURLConnectionDataDelegate, NSURLConnectionDelegate>{
    //定义一个可变的二进制数据  （用于回调数据的拼接）
    NSMutableData *_downloadData;
}


@property (nonatomic, strong) NSString *appID;

@property (nonatomic, strong) NSString *lastVersion;

@property (nonatomic, strong) NSString *trackViewURL;

@property (nonatomic, strong) NSString *trackName;

@property (nonatomic, strong) NSString *currenVersion;

@end

@implementation UpdataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"软件更新";
    
    //http://itunes.apple.com/cn/app/pocket-cupid-valentine-photo/id498011423?mt=8
    
    
    NSURL *url = [NSURL URLWithString:@"http://itunes.apple.com/cn/lookup?id=498011423"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection connectionWithRequest:request delegate:self];
    
    
    /*同步请求
     
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
    
    NSError *error;
    
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
    
    NSLog(@"iiiiiii   %@",dic);
    
    if (error) {
        NSLog(@"%@",[error description]);
    }
    NSArray *array = [dic objectForKey:@"results"];
    if (![array count]) {
        NSLog(@"array = nil");
    }
    
    NSDictionary *subDic = [array objectAtIndex:0];
    
    _lastVersion = [subDic objectForKey:@"version"];
    _trackViewURL = [subDic objectForKey:@"trackViewUrl"];
    _trackName = [subDic objectForKey:@"trackName"];
    
    NSDictionary *vv = [[NSBundle mainBundle] infoDictionary];
    _currenVersion = [vv objectForKey:@"CFBundleVersion"];
    
    double current = [_currenVersion doubleValue];
    double upData = [_lastVersion doubleValue];
    
    if (current < upData) {
        NSString *title = [NSString stringWithFormat:@"检查更新：%@",_trackName];
        NSString *message = [NSString stringWithFormat:@"发现新版本：%@",_lastVersion];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"升级", nil];
        alert.tag = 1000;
        [alert show];
    }else{
        NSString *title = [NSString stringWithFormat:@"检查更新：%@",_trackName];
        NSString *message = [NSString stringWithFormat:@"暂无新版本"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        alert.tag = 1001;
        [alert show];
    }
    */

    
    
}

#pragma mark  实现协议方法
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    _downloadData = [[NSMutableData alloc] init];
    
    [_downloadData setLength:0];
    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_downloadData appendData:data];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    NSError *error;

    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:_downloadData options:NSJSONReadingMutableLeaves error:&error];
    
    if (error) {
        NSLog(@"%@",[error description]);
    }
    NSArray *array = [dic objectForKey:@"results"];
    if (![array count]) {
        NSLog(@"array = nil");
    }
    
    NSDictionary *subDic = [array objectAtIndex:0];
    
    _lastVersion = [subDic objectForKey:@"version"];
    _trackViewURL = [subDic objectForKey:@"trackViewUrl"];
    _trackName = [subDic objectForKey:@"trackName"];
    
    NSDictionary *vv = [[NSBundle mainBundle] infoDictionary];
    _currenVersion = [vv objectForKey:@"CFBundleVersion"];
    
    double current = [_currenVersion doubleValue];
    double upData = [_lastVersion doubleValue];
    
    if (current < upData) {
        NSString *title = [NSString stringWithFormat:@"检查更新：%@",_trackName];
        NSString *message = [NSString stringWithFormat:@"发现新版本：%@",_lastVersion];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"升级", nil];
        alert.tag = 1000;
        [alert show];
    }else{
        NSString *title = [NSString stringWithFormat:@"检查更新：%@",_trackName];
        NSString *message = [NSString stringWithFormat:@"暂无新版本"];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        alert.tag = 1001;
        [alert show];
    }
    
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"网络请求失败时，调用");
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1000) {
        if (buttonIndex == 1) {
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_trackViewURL]];
        }
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
