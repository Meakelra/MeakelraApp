//
//  RemakeViewController.m
//  AV
//
//  Created by 潘颖超 on 15/11/3.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "RemakeViewController.h"

@interface RemakeViewController ()

@property (nonatomic, assign) BOOL     isYes;

@property (nonatomic, strong) UIButton *button;

@end

@implementation RemakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Remake";
    
    _isYes = YES;
    
    _button = [UIButton buttonWithType:UIButtonTypeSystem];
    _button.frame = CGRectMake(20, 100, 100, 100);
    _button.backgroundColor = [UIColor redColor];
    [_button setTitle:@"Move" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
}

- (void)buttonClick:(UIButton *)button{
    _isYes = !_isYes;
    
    [self.view setNeedsUpdateConstraints];
    [self.view updateConstraintsIfNeeded];
    
    
    [UIView animateWithDuration:2 animations:^{
        //
        [self.view layoutIfNeeded];
    }];
    
}


- (void)updateViewConstraints {
    [super updateViewConstraints];
    
    [self.button mas_updateConstraints:^(MASConstraintMaker *make) {
        //
        
        make.height.equalTo(@(100));
        make.width.equalTo(@(100));
        
        
        if (self.isYes) {
            NSLog(@"123");
            
            make.left.equalTo(self.view).with.offset(10);
            make.top.equalTo(self.view).with.offset(70);
            
        }else{
            NSLog(@"456");
            
            make.right.equalTo(self.view).with.offset(-10);
            make.bottom.equalTo(self.view).with.offset(-20);
        }
        
        
    }];
}

+ (BOOL)requiresConstraintBasedLayout
{
    return YES;
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
