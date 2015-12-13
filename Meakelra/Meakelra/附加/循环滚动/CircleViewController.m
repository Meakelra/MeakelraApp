//
//  CircleViewController.m
//  Meakelra
//
//  Created by xiao_yu on 15/12/7.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "CircleViewController.h"

@interface CircleViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UIPageControl *pageControl;


@end

@implementation CircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.bounces = NO;
    _scrollView.pagingEnabled = YES;
    
    //0  1 2 3 4 5 6 7 8 9 10 11
    //10 1 2 3 4 5 6 7 8 9 10 1
    NSMutableArray *arrayImage = [[NSMutableArray alloc] initWithCapacity:0];
    [arrayImage addObject:[UIImage imageNamed:[NSString stringWithFormat:@"火影10.png"]]];
    for (int i = 1; i <= 10; i ++) {
        UIImage *image = [[UIImage alloc] init];
        if (i <= 9) {
            image = [UIImage imageNamed:[NSString stringWithFormat:@"火影0%d",i]];
        }else{
            image = [UIImage imageNamed:[NSString stringWithFormat:@"火影%d",i]];
        }
        [arrayImage addObject:image];
    }
    [arrayImage addObject:[UIImage imageNamed:@"火影01.png"]];
    for (int i = 0; i < arrayImage.count; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * self.view.frame.size.width, 0, self.view.frame.size.width, self.view.frame.size.height)];
        imageView.image = arrayImage[i];
        [_scrollView addSubview:imageView];
    }
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 12, self.view.frame.size.height);
    _scrollView.contentOffset = CGPointMake(320, 0);
    [self.view addSubview:_scrollView];
    
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(20, 430, 280, 30)];
    _pageControl.backgroundColor = [UIColor grayColor];
    _pageControl.numberOfPages = arrayImage.count - 2;
    _pageControl.currentPage = 0;
    _pageControl.pageIndicatorTintColor = [UIColor cyanColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [_pageControl addTarget:self action:@selector(pageControlClick:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_pageControl];
    

}
- (void)pageControlClick:(UIPageControl *)pageControl{
    int i = pageControl.currentPage;
    [UIView animateWithDuration:0.5 animations:^{
        _scrollView.contentOffset = CGPointMake((i + 1) * self.view.frame.size.width, 0);
    }];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 0 1 2 3 4 5 6 7 8 9 10 11
    //10 1 2 3 4 5 6 7 8 9 10 1
    int i = _scrollView.contentOffset.x / self.view.frame.size.width;
    if (i == 0 || i == 11) {
        if (i == 0) {
            i = 10;
        }else{
            i = 1;
        }
        _scrollView.contentOffset = CGPointMake(i * self.view.frame.size.width, 0);
        
    }
    //1 2 3 4 5 6 7 8 9 10
    //0 1               9
    _pageControl.currentPage = i - 1;
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
