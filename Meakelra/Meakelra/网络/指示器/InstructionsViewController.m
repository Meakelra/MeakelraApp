//
//  InstructionsViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/11/30.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "InstructionsViewController.h"
#import "StateViewController.h"
#import "SystemViewController.h"
#import "HudViewController.h"

@interface InstructionsViewController ()

@end

@implementation InstructionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"指示器";
    
    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"状态栏", @"系统指示器", @"三方指示器"]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            StateViewController *state = [[StateViewController alloc] init];
            [self.navigationController pushViewController:state animated:YES];
        }
            break;
        case 1:{
            SystemViewController *system = [[SystemViewController alloc] init];
            [self.navigationController pushViewController:system animated:YES];
        }
            break;
        case 2:{
            HudViewController *hud = [[HudViewController alloc] init];
            [self.navigationController pushViewController:hud animated:YES];
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
