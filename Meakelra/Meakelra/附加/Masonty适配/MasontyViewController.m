//
//  MasontyViewController.m
//  Meakelra
//
//  Created by xiao_yu on 15/12/7.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "MasontyViewController.h"
#import "LabelViewController.h"
#import "SizeViewController.h"
#import "ConstraintViewController.h"
#import "RemakeViewController.h"
#import "UpdateViewController.h"
#import "BasicViewController.h"


@interface MasontyViewController ()

//基本界面
@property (nonatomic, strong) BasicViewController      *basic;
@property (nonatomic, strong) UpdateViewController     *update;
@property (nonatomic, strong) RemakeViewController     *remake;
@property (nonatomic, strong) ConstraintViewController *contraint;
@property (nonatomic, strong) SizeViewController       *size;
@property (nonatomic, strong) LabelViewController      *label;


@end

@implementation MasontyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.dataArray = [[NSMutableArray alloc] initWithArray:@[@"Basic",@"Update",@"Remake",@"Constraint",@"size",@"label"]];
    
    self.tableView.frame = CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:{
            _basic = [[BasicViewController alloc] init];
            [self.navigationController pushViewController:_basic animated:YES];
        }
            break;
        case 1:{
            _update =[[UpdateViewController alloc] init];
            [self.navigationController pushViewController:_update animated:YES];
        }
            break;
        case 2:{
            _remake = [[RemakeViewController alloc] init];
            [self.navigationController pushViewController:_remake animated:YES];
        }
            break;
        case 3:{
            _contraint = [[ConstraintViewController alloc] init];
            [self.navigationController pushViewController:_contraint animated:YES];
        }
            break;
        case 4:{
            _size = [[SizeViewController alloc] init];
            [self.navigationController pushViewController:_size animated:YES];
        }
            break;
        case 5:{
            _label = [[LabelViewController alloc] init];
            [self.navigationController pushViewController:_label animated:YES];
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
