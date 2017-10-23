//
//  AppDelegate.m
//  3DTouch
//
//  Created by 沈凯 on 2017/8/18.
//  Copyright © 2017年 Ssky. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    判断系统版本大于9.0(只支持9.0以上的操作)
    if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 9.0) {
//        自定义图标的设置方法
//        UIApplicationShortcutIcon *home = [UIApplicationShortcutIcon iconWithTemplateImageName:@""];
//        系统图标的设置方法
        UIApplicationShortcutIcon *home = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeHome];
//        主标题和图标必须设置
        UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc]initWithType:@"type" localizedTitle:@"主标题、子标题、图标" localizedSubtitle:@"子标题" icon:home userInfo:nil];
        UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc]initWithType:@"type" localizedTitle:@"主标题、图标" localizedSubtitle:nil icon:[UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeAdd] userInfo:nil];
        // 设置按钮
        [[UIApplication sharedApplication] setShortcutItems:[@[item1,item2]mutableCopy]];
    }
    return YES;
}
// 通过3dtouch菜单启动
- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    NSLog(@"%@", shortcutItem.localizedTitle);
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
