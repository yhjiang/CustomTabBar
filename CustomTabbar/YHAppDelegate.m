//
//  YHAppDelegate.m
//  CustomTabbar
//
//  Created by Jiang on 14-5-28.
//  Copyright (c) 2014年 Johnny. All rights reserved.
//

#import "YHAppDelegate.h"

#import "YHCustomTabbar.h"

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
#import "FourthViewController.h"

@implementation YHAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self configureViewControllers];
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)configureViewControllers
{
    //初始化ViewController
    FirstViewController *home = [[FirstViewController alloc] init];
    home.title = @"首页";
    
    SecondViewController *list = [[SecondViewController alloc] init];
    list.title = @"订单";
    
    ThirdViewController *search = [[ThirdViewController alloc] init];
    search.title = @"搜索";
    
    FourthViewController *more = [[FourthViewController alloc] init];
    more.title = @"更多";
    
    //创建导航
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:home];
    UINavigationController *nav2 = [[ UINavigationController alloc] initWithRootViewController:list];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:search];
    UINavigationController *nav4 = [[UINavigationController alloc]initWithRootViewController:more];
    
    //把VC放到数组中
    NSMutableArray *controllers = [NSMutableArray arrayWithArray:@[nav1,nav2,nav3,nav4]];
    
    //初始化Tabbarcontroller
    _tabbarController = [[YHCustomTabbar alloc] init];
    _tabbarController.viewControllers = controllers;
    _tabbarController.selectedIndex = 0;
    
    [self.window setRootViewController:_tabbarController];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
