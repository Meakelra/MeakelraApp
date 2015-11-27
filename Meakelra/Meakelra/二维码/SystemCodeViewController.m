//
//  SystemCodeViewController.m
//  test
//
//  Created by 潘颖超 on 15/11/25.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "SystemCodeViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface SystemCodeViewController ()<AVCaptureMetadataOutputObjectsDelegate>
{
    int     num;
    BOOL    upOrdown;
    NSTimer *timer;
}
@property (strong, nonatomic) AVCaptureDevice            *device;
@property (strong, nonatomic) AVCaptureDeviceInput       *input;
@property (strong, nonatomic) AVCaptureMetadataOutput    *output;
@property (strong, nonatomic) AVCaptureSession           *session;
@property (strong, nonatomic) AVCaptureVideoPreviewLayer *preview;
@property (nonatomic, retain) UIImageView                *line;


@end

@implementation SystemCodeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor grayColor];
    
    UIButton * scanButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [scanButton setTitle:@"取消/返回" forState:UIControlStateNormal];
    scanButton.layer.borderColor = [UIColor redColor].CGColor;
    scanButton.layer.borderWidth = 1;
    scanButton.frame = CGRectMake(100, 450, [[UIScreen mainScreen] bounds].size.width - 200, 30);
    [scanButton addTarget:self action:@selector(backAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scanButton];
    
    UILabel * labIntroudction= [[UILabel alloc] initWithFrame:CGRectMake(15, 40, [[UIScreen mainScreen] bounds].size.width - 30, 50)];
    labIntroudction.backgroundColor = [UIColor clearColor];
    labIntroudction.numberOfLines=2;
    labIntroudction.tag = 1000;
    labIntroudction.textColor=[UIColor whiteColor];
    labIntroudction.text=@"将二维码图像置于矩形方框内，离手机摄像头10CM左右，系统会自动识别。";
    [self.view addSubview:labIntroudction];
    
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 100, [[UIScreen mainScreen] bounds].size.width - 20, [[UIScreen mainScreen] bounds].size.width - 20)];
    imageView.image = [UIImage imageNamed:@"pick_bg"];
    [self.view addSubview:imageView];
    
    upOrdown = NO;
    num = 0;
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(50, 110, [[UIScreen mainScreen] bounds].size.width - 100, 2)];
    _line.image = [UIImage imageNamed:@"line.png"];
    [self.view addSubview:_line];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
    
    
    
    
}
-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake(50, 110+2*num, [[UIScreen mainScreen] bounds].size.width - 100, 2);
        if (2*num == ([[UIScreen mainScreen] bounds].size.width - 40)  || 2*num == ([[UIScreen mainScreen] bounds].size.width - 40) - 1) {
            upOrdown = YES;
        }
//        NSLog(@"%f",([[UIScreen mainScreen] bounds].size.width - 100));
    }
    else {
        num --;
        _line.frame = CGRectMake(50, 110+2*num, [[UIScreen mainScreen] bounds].size.width - 100, 2);
        if (num == 0) {
            upOrdown = NO;
        }
    }
    
}
-(void)backAction
{
    
    [self dismissViewControllerAnimated:YES completion:^{
        [timer invalidate];
    }];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self setupCamera];
}
- (void)setupCamera
{
    // Device
    _device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    // Input
    _input = [AVCaptureDeviceInput deviceInputWithDevice:self.device error:nil];
    
    // Output
    _output = [[AVCaptureMetadataOutput alloc]init];
    [_output setMetadataObjectsDelegate:self queue:dispatch_get_main_queue()];
    
    // Session
    _session = [[AVCaptureSession alloc]init];
    [_session setSessionPreset:AVCaptureSessionPresetHigh];
    if ([_session canAddInput:self.input])
    {
        [_session addInput:self.input];
    }
    
    if ([_session canAddOutput:self.output])
    {
        [_session addOutput:self.output];
    }
    
    // 条码类型 AVMetadataObjectTypeQRCode
    _output.metadataObjectTypes =@[AVMetadataObjectTypeQRCode];
    
    // Preview
    _preview =[AVCaptureVideoPreviewLayer layerWithSession:self.session];
    _preview.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _preview.frame =CGRectMake(20,110,[[UIScreen mainScreen] bounds].size.width - 40,[[UIScreen mainScreen] bounds].size.width - 40);
    [self.view.layer insertSublayer:self.preview atIndex:0];
    
    
    
    // Start
    [_session startRunning];
}
#pragma mark AVCaptureMetadataOutputObjectsDelegate
- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputMetadataObjects:(NSArray *)metadataObjects fromConnection:(AVCaptureConnection *)connection
{
    
    NSString *stringValue;
    
    if ([metadataObjects count] >0)
    {
        AVMetadataMachineReadableCodeObject * metadataObject = [metadataObjects objectAtIndex:0];
        stringValue = metadataObject.stringValue;
    }
    
    [_session stopRunning];
//    [self dismissViewControllerAnimated:YES completion:^
//     {
         [timer invalidate];
    
    UILabel *label = (UILabel *)[self.view viewWithTag:1000];
    label.text = stringValue;
    
//     }];
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
