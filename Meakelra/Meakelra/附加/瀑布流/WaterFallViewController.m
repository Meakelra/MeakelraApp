//
//  WaterFallViewController.m
//  Meakelra
//
//  Created by xiao_yu on 15/12/7.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "WaterFallViewController.h"

@interface WaterFallViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *aDataArray;
@property (nonatomic, strong) NSMutableArray *bDataArray;
@property (nonatomic, strong) NSMutableArray *cDataArray;

@property (nonatomic, strong) UITableView *aTableView;
@property (nonatomic, strong) UITableView *bTableView;
@property (nonatomic, strong) UITableView *cTableView;

@end

@implementation WaterFallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //数据源
    _aDataArray = [[NSMutableArray alloc] initWithCapacity:0];
    _bDataArray = [[NSMutableArray alloc] initWithCapacity:0];
    _cDataArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (int i = 0; i < 100; i ++) {
        [_aDataArray addObject:[NSString stringWithFormat:@"%d",i]];
        [_bDataArray addObject:[NSString stringWithFormat:@"%d",i + 500]];
        [_cDataArray addObject:[NSString stringWithFormat:@"%d",i + 1000]];
    }
    
    //UITableView
    _aTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width / 3.0, self.view.frame.size.height) style:UITableViewStylePlain];
    _aTableView.delegate = self;
    _aTableView.dataSource = self;
    [self.view addSubview:_aTableView];
    
    _aTableView.showsVerticalScrollIndicator = NO;
    
    _bTableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 3.0, 0, self.view.frame.size.width / 3.0, self.view.frame.size.height) style:UITableViewStylePlain];
    _bTableView.delegate = self;
    _bTableView.dataSource = self;
    [self.view addSubview:_bTableView];
    _bTableView.showsVerticalScrollIndicator = NO;
    
    _cTableView = [[UITableView alloc] initWithFrame:CGRectMake((self.view.frame.size.width / 3.0) * 2, 0, self.view.frame.size.width / 3.0, self.view.frame.size.height) style:UITableViewStylePlain];
    _cTableView.delegate = self;
    _cTableView.dataSource = self;
    [self.view addSubview:_cTableView];

}

#pragma mark - 代理方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _aTableView) {
        return _aDataArray.count;
    }
    if (tableView == _bTableView) {
        return _bDataArray.count;
    }
    return _cDataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *iden = @"iden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    if (tableView == _aTableView) {
        cell.textLabel.text = _aDataArray[indexPath.row];
    }else if (tableView == _bTableView){
        cell.textLabel.text = _bDataArray[indexPath.row];
    }else{
        cell.textLabel.text = _cDataArray[indexPath.row];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _aTableView) {
        return 40;
    }else if (tableView == _bTableView) {
        return 70;
    }else{
        return 50;
    }
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView == _aTableView) {
        _bTableView.contentOffset = _aTableView.contentOffset;
        _cTableView.contentOffset = _aTableView.contentOffset;
    }else if (scrollView == _bTableView){
        _aTableView.contentOffset = _bTableView.contentOffset;
        _cTableView.contentOffset = _bTableView.contentOffset;
    }else{
        _aTableView.contentOffset = _cTableView.contentOffset;
        _bTableView.contentOffset = _cTableView.contentOffset;
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
