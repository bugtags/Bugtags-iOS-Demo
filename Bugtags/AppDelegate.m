//
//  AppDelegate.m
//  Bugtags
//
//  Created by Bugtags on 15/7/28.
//  Copyright (c) 2015年 bugtags.com. All rights reserved.
//

#import "AppDelegate.h"
#import <Bugtags/Bugtags.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.barTintColor = [UIColor colorWithRed:34 / 255.0 green:159 / 255.0 blue:252 / 255.0 alpha:1.0];
    navigationBar.tintColor = [UIColor whiteColor];
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
    
    BugtagsOptions *options = [[BugtagsOptions alloc] init];
    options.hotfixDataMode = BTGDataModeProduction;
    options.remoteConfigDataMode = BTGDataModeProduction;
    [Bugtags startWithAppKey:@"195e2e79b54c36f154e64bef6b093dd1" invocationEvent:BTGInvocationEventBubble options:options];
    [Bugtags setBeforeSendingCallback:^{
       
        [Bugtags setUserData:@"这是一个问题提交之前的回调 sample" forKey:@"flag"];
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        NSLog(@"### %@", [[Bugtags remoteConfig] stringForKey:@"feature_1"]);
    });
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
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
