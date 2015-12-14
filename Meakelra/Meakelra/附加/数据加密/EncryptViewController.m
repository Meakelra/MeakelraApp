//
//  EncryptViewController.m
//  Meakelra
//
//  Created by xiao_yu on 15/12/13.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "EncryptViewController.h"
#import "Base64codeFunc.h"

@interface EncryptViewController ()

@end

@implementation EncryptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *string = @"需要加密的字符串";
    //加密后的字符串
    NSString *encodeString = nil;
    //解密后的字符串
    NSString *decodeString = nil;
    //stringToBase64
    encodeString  = __BASE64(string);
    //base64ToString
    decodeString = __TEXT(encodeString);
    NSLog(@"%@    %@",encodeString, decodeString);
    
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
