//
//  YHAppDelegate.h
//  CustomTabbar
//
//  Created by Jiang on 14-5-28.
//  Copyright (c) 2014年 Johnny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YHCustomTabbar;

@interface YHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) YHCustomTabbar *tabbarController;

@end
