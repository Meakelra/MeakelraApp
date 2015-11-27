//
//  AdditionViewController.m
//  test
//
//  Created by 潘颖超 on 15/11/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "AdditionViewController.h"

@interface AdditionViewController ()

@end

@implementation AdditionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"附加";
    
    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"本地图片缓存",@"流媒体下载与播放", @"图文混排", @"瀑布流", @"滚动视图复用", @"蓝牙通信", @"2D绘图", @"GameCenter", @"应用内购", @"常用支付方式", @"广告联盟", @"XMPP", @"动态局部更新程序", @"单元测试", @"通讯录", @"循环滚动", @"音视频播放", @"登录cookie的处理", @"数据检验（正则表达式）", @"数据加密（密码或接口数据）", @"从相册多选图片，连拍图片并且通过POST上传，需要有上传进度", @"旋转适配", @"可复用自定义组件或库", @"运行时使用", @"私有API使用", @"网页交互", @"云搜索", @"指纹识别", @"核心动画", @"3DTouch", @"加速器", @"Http协议封装", @"下拉刷新", @"图片加载", @"SCNavigation", @"RDVTabBarController", @"Masonry适配"]];
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
