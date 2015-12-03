//
//  DownLoadViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/12/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "DownLoadViewController.h"
#import "AFDownViewController.h"
#import "ConnectionViewController.h"
#import "SessionDownViewController.h"

@interface DownLoadViewController ()

@end

@implementation DownLoadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"AFNet", @"NSURLConnection", @"NSURLSession"]];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            AFDownViewController *AFDown = [[AFDownViewController alloc] init];
            [self.navigationController pushViewController:AFDown animated:YES];
        }
            break;
        case 1:{
            ConnectionViewController *connection = [[ConnectionViewController alloc] init];
            [self.navigationController pushViewController:connection animated:YES];
        }
            break;
        case 2:{
            SessionDownViewController *session = [[SessionDownViewController alloc] init];
            [self.navigationController pushViewController:session animated:YES];
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
