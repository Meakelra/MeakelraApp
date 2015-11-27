//
//  CodeViewController.m
//  test
//
//  Created by 潘颖超 on 15/11/25.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "CodeViewController.h"
#import "MakeCodeViewController.h"
#import "SystemCodeViewController.h"
#import "ZBarCodeViewController.h"

@interface CodeViewController ()

@end

@implementation CodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"二维码相关";
    
    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"二维码生成", @"", @"二维码扫描", @"ZbarSDK"]];
    self.tableView.frame = CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 64);
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            MakeCodeViewController *makeCode = [[MakeCodeViewController alloc] init];
            [self.navigationController pushViewController:makeCode animated:YES];
        }
            break;
            
        case 2:{
            SystemCodeViewController *systemCode = [[SystemCodeViewController alloc] init];
//            [self.navigationController pushViewController:systemCode animated:YES];
            [self presentViewController:systemCode animated:YES completion:^{
                //
            }];
        }
            break;
            
        case 3:{
            ZBarCodeViewController *code = [[ZBarCodeViewController alloc] init];
            [self presentViewController:code animated:YES completion:^{
                //
            }];
        }
            
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
