//
//  DataTestViewController.m
//  Meakelra
//
//  Created by xiao_yu on 15/12/13.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "DataTestViewController.h"
#import "RegexKitLite.h"

@interface DataTestViewController ()

@end

@implementation DataTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    NSString *email = @"kkk@aaa.com";
    
   BOOL is =  [email isMatchedByRegex:@"\\b([a-zA-Z0-9%_.+\\-]+)@([a-zA-Z0-9.\\-]+?\\.[a-zA-Z]{2,6})\\b"];
    NSLog(@"%hhd",is);
    
//    NSString *searchString = @ "This is neat." ;
//    NSString *regexString  = @"//s+" ;
//    NSArray  *splitArray   = NULL;
//    splitArray = [searchString componentsSeparatedByRegex:regexString];
//    // splitArray == { @"This", @"is", @"neat." }
//    NSLog(@"splitArray: %@" , splitArray);
    
    NSString *searchString = @"This is neat.";
    NSString *regexString  = @"//s+";
    NSArray  *splitArray   = NULL;
    splitArray = [searchString componentsSeparatedByRegex:regexString];
    // splitArray == { @"This", @"is", @"neat." }
    NSLog(@"splitArray: %@", splitArray);
    
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
