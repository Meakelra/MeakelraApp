//
//  ApplicableViewController.m
//  test
//
//  Created by 潘颖超 on 15/11/26.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "ApplicableViewController.h"
#import "NSAppViewController.h"
#import "BitcodeViewController.h"
#import "ConfidenceViewController.h"
#import "FontViewController.h"
#import "URLViewController.h"
#import "TableViewController.h"

@interface ApplicableViewController ()

@end

@implementation ApplicableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"iOS9适配";
    
    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"NSAppTransportSecurity", @"Bitcode", @"设置信任", @"字体", @"URL scheme", @"UITableView"]];
    
    self.tableView.frame = CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 64);
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            NSAppViewController *app = [[NSAppViewController alloc] init];
            [self.navigationController pushViewController:app animated:YES];
        }
            break;
        case 1:{
            BitcodeViewController *bit = [[BitcodeViewController alloc] init];
            [self.navigationController pushViewController:bit animated:YES];
        }
            break;
        case 2:{
            ConfidenceViewController *confidence = [[ConfidenceViewController alloc] init];
            [self.navigationController pushViewController:confidence animated:YES];
        }
            break;
        case 3:{
            FontViewController *font = [[FontViewController alloc] init];
            [self.navigationController pushViewController:font animated:YES];
        }
            break;
        case 4:{
            URLViewController *url = [[URLViewController alloc] init];
            [self.navigationController pushViewController:url animated:YES];
        }
            break;
        case 5:{
            TableViewController *table = [[TableViewController alloc] init];
            [self.navigationController pushViewController:table animated:YES];
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
