//
//  PullDownRefreshViewController.m
//  Meakelra
//
//  Created by xiao_yu on 15/12/7.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "PullDownRefreshViewController.h"

@interface PullDownRefreshViewController ()

{
    NSMutableArray *_dataArr;
    UITableView *_tableView;
    
    //下一次上拉加载的页数
    NSInteger _page;
}


@end

@implementation PullDownRefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
