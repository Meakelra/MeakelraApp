//
//  ZBarCodeViewController.m
//  test
//
//  Created by 潘颖超 on 15/11/25.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ZBarCodeViewController.h"
#import "ZBarSDK.h"

@interface ZBarCodeViewController ()<UINavigationControllerDelegate, UIImagePickerControllerDelegate, ZBarReaderDelegate>{
    int     num;
    BOOL    upOrdown;
    NSTimer *timer;
    
}
@property (nonatomic, strong) UIImageView *line;

@end

@implementation ZBarCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton * scanButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [scanButton setTitle:@"扫描" forState:UIControlStateNormal];
    scanButton.frame = CGRectMake(100, 100, 120, 40);
    [scanButton addTarget:self action:@selector(setupCamera) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scanButton];
}

-(void)setupCamera
{
    num = 0;
    upOrdown = NO;
    //初始话ZBar
    ZBarReaderViewController * reader = [[ZBarReaderViewController alloc] init];
    //设置代理
    reader.readerDelegate = self;
    //支持界面旋转
    reader.supportedOrientationsMask = ZBarOrientationMaskAll;
    reader.showsHelpOnFail = NO;
    reader.scanCrop = CGRectMake(0.1, 0.2, 0.8, 0.8);//扫描的感应框
    ZBarImageScanner * scanner = reader.scanner;
    [scanner setSymbology:ZBAR_I25
                   config:ZBAR_CFG_ENABLE
                       to:0];
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 420)];
    view.backgroundColor = [UIColor clearColor];
    reader.cameraOverlayView = view;
    
    
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 280, 40)];
    label.text = @"请将扫描的二维码至于下面的框内\n谢谢！";
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.lineBreakMode = 0;
    label.numberOfLines = 2;
    label.backgroundColor = [UIColor clearColor];
    [view addSubview:label];
    
    UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"pick_bg.png"]];
    image.frame = CGRectMake(20, 80, 280, 280);
    [view addSubview:image];
    
    
    _line = [[UIImageView alloc] initWithFrame:CGRectMake(30, 10, 220, 2)];
    _line.image = [UIImage imageNamed:@"line.png"];
    [image addSubview:_line];
    //定时器，设定时间过1.5秒，
    timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(animation1) userInfo:nil repeats:YES];
    
    [self presentViewController:reader animated:YES completion:^{
        
    }];
}
-(void)animation1
{
    if (upOrdown == NO) {
        num ++;
        _line.frame = CGRectMake(30, 10+2*num, 220, 2);
        if (2*num == 260) {
            upOrdown = YES;
        }
    }
    else {
        num --;
        _line.frame = CGRectMake(30, 10+2*num, 220, 2);
        if (num == 0) {
            upOrdown = NO;
        }
    }
    
    
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [timer invalidate];
    _line.frame = CGRectMake(30, 10, 220, 2);
    num = 0;
    upOrdown = NO;
    [picker dismissViewControllerAnimated:YES completion:^{
        [picker removeFromParentViewController];
    }];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [timer invalidate];
    _line.frame = CGRectMake(30, 10, 220, 2);
    num = 0;
    upOrdown = NO;
    [picker dismissViewControllerAnimated:YES completion:^{
        [picker removeFromParentViewController];
        UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];
        //初始化
        ZBarReaderController * read = [ZBarReaderController new];
        //设置代理
        read.readerDelegate = self;
        CGImageRef cgImageRef = image.CGImage;
        ZBarSymbol * symbol = nil;
        id <NSFastEnumeration> results = [read scanImage:cgImageRef];
        for (symbol in results)
        {
            break;
        }
        NSString * result;
        if ([symbol.data canBeConvertedToEncoding:NSShiftJISStringEncoding])
            {
            result = [NSString stringWithCString:[symbol.data cStringUsingEncoding: NSShiftJISStringEncoding] encoding:NSUTF8StringEncoding];
        }
        else{
            result = symbol.data;
        }
        
        NSLog(@"%@",result);
        
    }];
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
