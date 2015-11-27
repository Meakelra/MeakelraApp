//
//  LocalViewController.m
//  test
//
//  Created by 潘颖超 on 15/11/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "LocalViewController.h"
#import "CodeViewController.h"
#import "MemoryWarningViewController.h"
#import "ApplicableViewController.h"

@interface LocalViewController ()

@end

@implementation LocalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"本地";
    
    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"多表数据库", @"国际化", @"界面适配", @"iOS9适配", @"二维码", @"内存警告处理", @"cocoapods第三方库管理"]];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 3:{
            ApplicableViewController *app = [[ApplicableViewController alloc] init];
            app.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:app animated:YES];
        }
            break;
        case 4:{
            CodeViewController *code = [[CodeViewController alloc] init];
            code.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:code animated:YES];
        }
            break;
        case 5:{
            MemoryWarningViewController *warning = [[MemoryWarningViewController alloc] init];
            warning.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:warning animated:YES];
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
