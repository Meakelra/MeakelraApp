//
//  AppDelegate.m
//  Meakelra
//
//  Created by 潘颖超 on 15/11/27.
//  Copyright © 2015年 Meakelra. All rights reserved.
//

#import "AppDelegate.h"
#import "CustomTabBarController.h"
#import "APService.h"
//464648e94c21107db1f733cf

/*
 当程序启动时
 
 1、判断launchOptions字典内的UIApplicationLaunchOptionsShortcutItemKey是否为空
 2、当不为空时,application:didFinishLaunchWithOptions方法返回NO，否则返回YES
 3、在application:performActionForShortcutItem:completionHandler方法内处理点击事件
 */

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //设置根视图控制器
    self.window.rootViewController = [[CustomTabBarController alloc] init];
    
    
    
    
    //注册推送
    [APService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge |
                                                   UIRemoteNotificationTypeSound |
                                                   UIRemoteNotificationTypeAlert)
                                       categories:nil];
    [APService setupWithOption:launchOptions];
    

    
    //注册本地通知
    [[UIApplication sharedApplication]registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert categories:nil]];

    
    
    
    [self.window makeKeyAndVisible];
    
    [self configShortCutItems];
    if (launchOptions[@"UIApplicationLaunchOptionsShortcutItemKey"] == nil) {
        return YES;
    } else {
        return NO;
    }

}


//接受从服务器中请求下来的device token,并且将device token传送给极光服务器
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    
    [APService registerDeviceToken:deviceToken];
}

//接收发送的消息
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [APService handleRemoteNotification:userInfo];
    
}

//接收本地通知
-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    NSLog(@"%@",notification.alertBody);
}

/** 创建shortcutItems */
- (void)configShortCutItems {
    NSMutableArray *shortcutItems = [NSMutableArray array];
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"1" localizedTitle:@"测试1"];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"2" localizedTitle:@"测试2"];
    [shortcutItems addObject:item1];
    [shortcutItems addObject:item2];
    
    [[UIApplication sharedApplication] setShortcutItems:shortcutItems];
}
/** 处理shortcutItem */
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    switch (shortcutItem.type.integerValue) {
        case 1: { // 测试1
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoTestVc" object:self userInfo:@{@"type":@"1"}];
        }
        case 2: { // 测试2
            [[NSNotificationCenter defaultCenter] postNotificationName:@"gotoTestVc" object:self userInfo:@{@"type":@"2"}];
        }   break;
        default:
            break;
    }
}




- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
    [[UIApplication sharedApplication]cancelAllLocalNotifications];

}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
