//
//  HttpViewController.m
//  test
//
//  Created by 潘颖超 on 15/11/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "HttpViewController.h"
#import "PushViewController.h"
#import "UpdataViewController.h"
#import "CheckNetViewController.h"
#import "InstructionsViewController.h"
#import "CellHeightViewController.h"
#import "PerformanceViewController.h"
#import "DownLoadViewController.h"

@interface HttpViewController ()

@end

@implementation HttpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"网络";
    
    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"下载断点续传", @"*本地推送和远程推送*", @"第三方分享和登录 OAuth2.0实现", @"*软件更新检查*", @"*网络状态检查*", @"POST上传下载", @"*加载指示器*", @"*动态计算cell的高度*", @"*性能优化（内存，加载速度等）*", @"Mantle或者JsonModel"]];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            DownLoadViewController *downLoad = [[DownLoadViewController alloc] init];
            downLoad.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:downLoad animated:YES];
        }
            break;
        case 1:{
            PushViewController *push = [[PushViewController alloc] init];
            push.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:push animated:YES];
        }
            break;
        case 2:{
            
        }
            break;
        case 3:{
            UpdataViewController *updata = [[UpdataViewController alloc] init];
            updata.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:updata animated:YES];
        }
            break;
        case 4:{
            CheckNetViewController *checkNet = [[CheckNetViewController alloc] init];
            checkNet.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:checkNet animated:YES];
        }
            break;
        case 5:{
            
        }
            break;
        case 6:{
            InstructionsViewController *instructions = [[InstructionsViewController alloc] init];
            instructions.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:instructions animated:YES];
        }
            break;
        case 7:{
            CellHeightViewController *cell = [[CellHeightViewController alloc] init];
            cell.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:cell animated:YES];
        }
            break;
        case 8:{
            PerformanceViewController *performance = [[PerformanceViewController alloc] init];
            performance.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:performance animated:YES];
        }
            break;
        case 9:{
            
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
