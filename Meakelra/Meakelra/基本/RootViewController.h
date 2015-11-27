//
//  RootViewController.h
//  test
//
//  Created by 潘颖超 on 15/11/24.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "BaseViewController.h"

@interface RootViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UITableView    *tableView;

@end
