//
//  PushViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/11/30.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "PushViewController.h"
#import "LocalPushViewController.h"
#import "JGPushViewController.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"推送";
    
    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"本地推送", @"远程推送"]];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            LocalPushViewController *local = [[LocalPushViewController alloc] init];
            [self.navigationController pushViewController:local animated:YES];
        }
            break;
        case 1:{
            JGPushViewController *push = [[JGPushViewController alloc] init];
            [self.navigationController pushViewController:push animated:YES];
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
