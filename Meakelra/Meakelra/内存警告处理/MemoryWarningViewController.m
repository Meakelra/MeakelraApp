//
//  MemoryWarningViewController.m
//  test
//
//  Created by 潘颖超 on 15/11/26.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "MemoryWarningViewController.h"

@interface MemoryWarningViewController ()

@end

@implementation MemoryWarningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"内存警告";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width - 20, 100)];
    label.text = @"      iPhone下每个app可用的内存是被限制的，如果一个app使用的内存超过20M，则系统会向该app发送Memory Warning消息。收到此消息后，app必须正确处理，否则可能出错或者出现内存泄露。\n\n       app收到Memory Warning后会调用：UIApplication::didReceiveMemoryWarning -> UIApplicationDelegate::applicationDidReceiveMemoryWarning,然后调用当前所有的viewController进行处理。因此处理的主要工作是在viewController。\n\n        当我们的程序在第一次收到内存不足警告时，应该释放一些不用的资源，以节省部分内存。否则，当内存不足情形依然存在，iOS再次向我们程序发出内存不足的警告时，我们的程序将会被iOS kill掉。\n\n       iOS的UIViewController 类给我们提供了处理内存不足的接口。在iOS 3.0 之前，当系统的内存不足时，UIViewController的didReceiveMemoryWarining 方法会被调用，我们可以在didReceiveMemoryWarining 方法里释放掉部分暂时不用的资源。\n\n        从iOS3.0 开始，UIViewController增加了viewDidUnload方法。该方法和viewDIdLoad相配对。当系统内存不足时，首先UIViewController的didReceiveMemoryWarining 方法会被调用，而didReceiveMemoryWarining 会判断当前ViewController的view是否显示在window上，如果没有显示在window上，则didReceiveMemoryWarining 会自动将viewcontroller 的view以及其所有子view全部销毁，然后调用viewcontroller的viewdidunload方法。如果当前UIViewController的view显示在window上，则不销毁该viewcontroller的view，当然，viewDidunload也不会被调用了。但是到了ios6.0之后，这里又有所变化，ios6.0内存警告的viewDidUnload 被屏蔽，即又回到了ios3.0的时期的内存管理方式。\n\n        代码实现详见工程";
    label.numberOfLines = 0;
    [label sizeToFit];
    
    
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 64, [[UIScreen mainScreen] bounds].size.width - 20, [[UIScreen mainScreen] bounds].size.height - 64)];
    scrollView.contentSize = CGSizeMake([[UIScreen mainScreen] bounds].size.width - 20, label.frame.size.height);
    scrollView.pagingEnabled = NO;
    scrollView.bounces = NO;
    [self.view addSubview:scrollView];
    [scrollView addSubview:label];
    
}

- (void)didReceiveMemoryWarning {
    // Dispose of any resources that can be recreated.

    //iOS3-iOS5.0以前版本收到内存警告：调用didReceiveMemoryWarning内调用super的didReceiveMemoryWarning会将controller的view进行释放。所以我们不能将controller的view再次释放。处理方法：
    //[super didReceiveMemoryWarning];//如没有显示在window上，会自动将self.view释放。
    // ios6.0以前，不用在此做处理，self.view释放之后，会调用下面的viewDidUnload函数，在viewDidUnload函数中做处理就可以了。
    
    
    
    // Add code to clean up any of your own resources that are no longer necessary.

    //iOS6.0及以上版本的内存警告：调用didReceiveMemoryWarning内调用super的didReceiveMemoryWarning调只是释放controller的resouse，不会释放view处理方法：
    [super didReceiveMemoryWarning];//即使没有显示在window上，也不会自动的将self.view释放。
    // 此处做兼容处理需要加上ios6.0的宏开关，保证是在6.0下使用的,6.0以前屏蔽以下代码，否则会在下面使用self.view时自动加载viewDidUnLoad
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 6.0) {
        //需要注意的是self.isViewLoaded是必不可少的，其他方式访问视图会导致它加载 ，在WWDC视频也忽视这一点。
        if (self.isViewLoaded && !self.view.window)// 是否是正在使用的视图
        {
            // Add code to preserve data stored in the views that might be
            // needed later.
            
            // Add code to clean up other strong references to the view in
            // the view hierarchy.
            self.view = nil;// 目的是再次进入时能够重新加载调用viewDidLoad函数。
        }
    }
    
}
-(void)viewDidUnload
{
    // Release any retained subviews of the main view.不包含self.view
    //处理一些内存和资源问题。
    [super viewDidUnload];
    
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
