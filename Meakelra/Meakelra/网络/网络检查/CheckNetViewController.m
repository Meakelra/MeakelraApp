//
//  CheckNetViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/11/30.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "CheckNetViewController.h"
#import "ReachabilityCheckViewController.h"
#import "AFCheckViewController.h"

@interface CheckNetViewController ()

@end

@implementation CheckNetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    

    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"Reachability", @"AFNetworking"]];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            ReachabilityCheckViewController *reachability = [[ReachabilityCheckViewController alloc] init];
            [self.navigationController pushViewController:reachability animated:YES];
        }
            break;
        case 1:{
            AFCheckViewController *af = [[AFCheckViewController alloc] init];
            [self.navigationController pushViewController:af animated:YES];
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
