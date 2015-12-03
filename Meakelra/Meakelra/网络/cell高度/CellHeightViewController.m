//
//  CellHeightViewController.m
//  Meakelra
//
//  Created by 潘颖超 on 15/12/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "CellHeightViewController.h"
#import <AFNetworking.h>
#import <UIKit+AFNetworking.h>

#import "CellModel.h"
#import "AutoHeightTableViewCell.h"

#import "GDataXMLNode.h"

@interface CellHeightViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView    *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation CellHeightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height - 64)];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[AutoHeightTableViewCell class] forCellReuseIdentifier:@"iden"];
    
    NSString *urlStr = @"http://www.oschina.net/action/api/tweet_list?uid=0&pageIndex=0&pageSize=10";
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlStr parameters:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        
        GDataXMLDocument *document = [[GDataXMLDocument alloc] initWithData:responseObject options:0 error:nil];
        
        NSArray *tweetArr = [document nodesForXPath:@"//tweet" error:nil];
        
        for (GDataXMLElement *tweetEle in tweetArr) {
            CellModel *model = [[CellModel alloc] init];
        
            //查询一个节点所有的子节点
            NSArray *childArr = [tweetEle children];
        
            //遍历所有的子节点
            for (GDataXMLElement *childEle in childArr) {
                //kvc赋值
                [model setValue:childEle.stringValue forKey:childEle.name];
            }
            [_dataArray addObject:model];
        }
        [_tableView reloadData];

        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSLog(@"%@",error);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CellModel *model = [_dataArray objectAtIndex:indexPath.row];

    CGSize size = [model.body boundingRectWithSize:CGSizeMake(195, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:14] forKey:NSFontAttributeName] context:nil].size;

    if (!model.imgSmall.length) {
        return size.height + 10 + 20 + 10 + 10 + 20 + 10;
    }

    return size.height + 10 + 20 + 10 + 10 + 120 + 10 + 20 + 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AutoHeightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"iden" forIndexPath:indexPath];
    
//    cell.bodyLabel.backgroundColor = [UIColor grayColor];
//    cell.imgView.backgroundColor = [UIColor yellowColor];
    
    //根据cell的位置找到对应的数据模型
    CellModel *model = [_dataArray objectAtIndex:indexPath.row];
    
    [cell.iconView setImageWithURL:[NSURL URLWithString:model.portrait]];
    cell.nameLabel.text = model.author;
    cell.bodyLabel.text = model.body;
    
    //计算一个字符串完整展示所需要占用的size
    //第一个参数是最大不允许超过的size
    //第二个参数固定写法
    //第三个参数，字符串在计算size的时候用的属性（字体大小，阴影等）
    CGSize size = [model.body boundingRectWithSize:CGSizeMake([[UIScreen mainScreen] bounds].size.width - 125, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:[NSDictionary dictionaryWithObject:cell.bodyLabel.font forKey:NSFontAttributeName] context:nil].size;
    
    //根据计算结果修改label的frame
    CGRect frame = cell.bodyLabel.frame;
    frame.size.height = size.height + 5;
    cell.bodyLabel.frame = frame;
    
    //判断留言中是否有图片
    if (!model.imgSmall.length) {
        cell.imgView.hidden = YES;
        
    } else {
        cell.imgView.hidden = NO;
        [cell.imgView setImageWithURL:[NSURL URLWithString:model.imgSmall]];
        
        CGRect imgFrame = cell.imgView.frame;
        imgFrame.origin.y = frame.origin.y + frame.size.height + 10;
        cell.imgView.frame = imgFrame;
        
        frame = imgFrame;
    }
    
    //根据上面一个视图的frame修改留言日期的frame
    CGRect dateFrame = cell.dateLabel.frame;
    dateFrame.origin.y = frame.origin.y + frame.size.height + 10;
    cell.dateLabel.frame = dateFrame;
    
    cell.dateLabel.text = model.pubDate;
    
    return cell;
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
