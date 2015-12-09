//
//  3DTouchViewController.m
//  Meakelra
//
//  Created by xiao_yu on 15/12/9.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "TouchViewController.h"
#import "TestOneViewController.h"
#import "TestTwoViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface TouchViewController ()<UIViewControllerPreviewingDelegate>

@property (nonatomic, copy) NSArray *items;
// peek && pop 相关
@property (nonatomic, assign) CGRect sourceRect;       // 用户手势点 对应需要突出显示的rect
@property (nonatomic, strong) NSIndexPath *indexPath;  // 用户手势点 对应的indexPath


@end

@implementation TouchViewController

/*
 实现peek和pop手势：
 1、遵守协议 UIViewControllerPreviewingDelegate
 2、注册    [self registerForPreviewingWithDelegate:self sourceView:self.view];
 3、实现代理方法
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    // 处理shortCutItem 通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gotoTestVc:) name:@"gotoTestVc" object:nil];
    [self configTableView];
    // 注册Peek和Pop方法
    [self registerForPreviewingWithDelegate:self sourceView:self.view];
}

- (void)configTableView {
    self.dataArray = [[NSMutableArray alloc] initWithArray: @[@"第一条",@"第二条",@"第三条",@"第四条",@"第五条",@"第六条"]];
    self.tableView.rowHeight = 50;
}

#pragma mark tableView相关

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"第%zd个cell被点击/pop了",indexPath.row + 1);
}

#pragma mark 通知相关

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)gotoTestVc:(NSNotification *)noti {
    NSString *type = noti.userInfo[@"type"];
    UIViewController *testVc;
    if ([type isEqualToString:@"1"]) {        // 测试1
        testVc = [[TestOneViewController alloc] init];
    } else if ([type isEqualToString:@"2"]) { // 测试2
        testVc = [[TestTwoViewController alloc] init];
    }
    [self presentViewController:testVc animated:YES completion:nil];
}

#pragma mark peek && pop 代理方法

/** peek手势  */
- (nullable UIViewController *)previewingContext:(id <UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location {
    UIViewController *childVC = [[UIViewController alloc] init];
    
    // 获取用户手势点所在cell的下标。同时判断手势点是否超出tableView响应范围。
    if (![self getShouldShowRectAndIndexPathWithLocation:location]) return nil;
    
    previewingContext.sourceRect = self.sourceRect;
    
    // 加个白色背景
    UIView *bgView =[[UIView alloc] initWithFrame:CGRectMake(20, 10, kScreenWidth - 40, kScreenHeight - 20 - 64 * 2)];
    bgView.backgroundColor = [UIColor whiteColor];
    bgView.layer.cornerRadius = 10;
    bgView.clipsToBounds = YES;
    [childVC.view addSubview:bgView];
    
    // 加个lable
    UILabel *lable = [[UILabel alloc] initWithFrame:bgView.bounds];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.text = @"再按重一点...";
    [bgView addSubview:lable];
    
    return childVC;
}

/** pop手势  */
- (void)previewingContext:(id <UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit {
    [self tableView:self.tableView didSelectRowAtIndexPath:self.indexPath];
}

/** 获取用户手势点所在cell的下标。同时判断手势点是否超出tableView响应范围。*/
- (BOOL)getShouldShowRectAndIndexPathWithLocation:(CGPoint)location {
    NSInteger row = (location.y - 20)/50;
    self.sourceRect = CGRectMake(0, row * 50 + 20, kScreenWidth, 50);
    self.indexPath = [NSIndexPath indexPathForItem:row inSection:0];
    // 如果row越界了，返回NO 不处理peek手势
    return row >= self.items.count ? NO : YES;
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
