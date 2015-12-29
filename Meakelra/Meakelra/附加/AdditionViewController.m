//
//  AdditionViewController.m
//  test
//
//  Created by 潘颖超 on 15/11/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "AdditionViewController.h"
#import "MediumDownLoadViewController.h"
#import "WaterFallViewController.h"
#import "AddressBookViewController.h"
#import "PullDownRefreshViewController.h"
#import "CircleViewController.h"
#import "AudioPlayViewController.h"
#import "MasontyViewController.h"
#import "RDVTabViewController.h"
#import "SCNavViewController.h"
#import "TouchViewController.h"
#import "FingerprintViewController.h"
#import "UnitTestViewController.h"
#import "BlueToothViewController.h"
#import "EncryptViewController.h"
#import "DataTestViewController.h"
#import "ImageAndTextViewController.h"
#import "InsidePayViewController.h"
#import "GameCenterViewController.h"

@interface AdditionViewController ()

@end

@implementation AdditionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"附加";
    
    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"1本地图片缓存",@"2流媒体下载与播放", @"3图文混排", @"*4瀑布流*", @"5滚动视图复用", @"6蓝牙通信", @"72D绘图", @"8GameCenter", @"9应用内购", @"10常用支付方式", @"11广告联盟", @"12XMPP", @"13动态局部更新程序", @"14单元测试", @"*15通讯录*", @"*16循环滚动*", @"17音视频播放", @"18登录cookie的处理", @"19数据检验（正则表达式）", @"20数据加密（密码或接口数据）", @"21从相册多选图片，连拍图片并且通过POST上传，需要有上传进度", @"22旋转适配", @"23可复用自定义组件或库", @"24运行时使用", @"25私有API使用", @"26网页交互", @"27云搜索", @"*28指纹识别*", @"29核心动画", @"*303DTouch*", @"31加速器", @"32Http协议封装", @"33下拉刷新", @"34图片加载", @"35SCNavigation", @"36RDVTabBarController", @"*37Masonry适配*"]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            //本地图片缓存
        }
            break;
        case 1:{
            //流媒体下载与播放
            MediumDownLoadViewController *medium = [[MediumDownLoadViewController alloc] init];
            medium.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:medium animated:YES];
        }
            break;
        case 2:{
            //图文混排
            ImageAndTextViewController *image = [[ImageAndTextViewController alloc] init];
            image.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:image animated:YES];
        }
            break;
        case 3:{
            //瀑布流
            WaterFallViewController *waterFall = [[WaterFallViewController alloc] init];
            waterFall.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:waterFall animated:YES];
        }
            break;
        case 4:{
            //滚动视图复用
        }
            break;
        case 5:{
            //蓝牙通信
            BlueToothViewController *blueTooth = [[BlueToothViewController alloc] init];
            blueTooth.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:blueTooth animated:YES];
        }
            break;
        case 6:{
            //2D绘图
        }
            break;
        case 7:{
            //GameCenter
            GameCenterViewController *gameCenter = [[GameCenterViewController alloc] init];
            gameCenter.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:gameCenter animated:YES];
        }
            break;
        case 8:{
            //应用内购
            InsidePayViewController *insidePay = [[InsidePayViewController alloc] init];
            insidePay.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:insidePay animated:YES];
        }
            break;
        case 9:{
            //常用支付方式
        }
            break;
        case 10:{
            //广告联盟
        }
            break;
        case 11:{
            //XMPP
        }
            break;
        case 12:{
            //动态局部更新程序
        }
            break;
        case 13:{
            //单元测试
            UnitTestViewController *unitTest = [[UnitTestViewController alloc] init];
            unitTest.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:unitTest animated:YES];
        }
            break;
        case 14:{
            //通讯录
            AddressBookViewController *addressBook = [[AddressBookViewController alloc] init];
            addressBook.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:addressBook animated:YES];
        }
            break;
        case 15:{
            //循环滚动
            CircleViewController *circle = [[CircleViewController alloc] init];
            circle.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:circle animated:YES];
        }
            break;
        case 16:{
            //音视频播放
            AudioPlayViewController *audio = [[AudioPlayViewController alloc] init];
            audio.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:audio animated:YES];
        }
            break;
        case 17:{
            //登录cookie的处理
        }
            break;
        case 18:{
            //数据检验（正则表达式）
            DataTestViewController *dataTest = [[DataTestViewController alloc] init];
            dataTest.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:dataTest animated:YES];
        }
            break;
        case 19:{
            //数据加密（密码或接口数据）
            EncryptViewController *encrypt = [[EncryptViewController alloc] init];
            encrypt.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:encrypt animated:YES];
        }
            break;
        case 20:{
            //从相册多选图片，连拍图片并且通过POST上传，需要有上传进度
        }
            break;
        case 21:{
            //旋转适配
        }
            break;
        case 22:{
            //可复用自定义组件或库
        }
            break;
        case 23:{
            //运行时使用
        }
            break;
        case 24:{
            //私有API使用
        }
            break;
        case 25:{
            //网页交互
        }
            break;
        case 26:{
            //云搜索
        }
            break;
        case 27:{
            //指纹识别
            FingerprintViewController *finger = [[FingerprintViewController alloc] init];
            finger.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:finger animated:YES];
        }
            break;
        case 28:{
            //核心动画
        }
            break;
        case 29:{
            //3DTouch
            TouchViewController *touch = [[TouchViewController alloc] init];
            touch.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:touch animated:YES];
        }
            break;
        case 30:{
            //加速器
        }
            break;
        case 31:{
            //Http协议封装
        }
            break;
        case 32:{
            //下拉刷新
            PullDownRefreshViewController *pullDown = [[PullDownRefreshViewController alloc] init];
            pullDown.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:pullDown animated:YES];
        }
            break;
        case 33:{
            //图片加载
        }
            break;
        case 34:{
            //SCNavigation
            SCNavViewController *nav = [[SCNavViewController alloc] init];
            nav.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:nav animated:YES];
        }
            break;
        case 35:{
            //RDVTabBarController
            RDVTabViewController *tab = [[RDVTabViewController alloc] init];
            tab.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:tab animated:YES];
        }
            break;
        case 36:{
            //Masonry适配
            MasontyViewController *masonty = [[MasontyViewController alloc] init];
            masonty.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:masonty animated:YES];
        }
            break;
        default:
            break;
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
