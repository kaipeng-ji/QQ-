//
//  AppDelegate.m
//  侧拉抽屉
//
//  Created by ma c on 16/4/1.
//  Copyright © 2016年 Jujue. All rights reserved.
//

#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "LeftViewController.h"
#import "centerViewController.h"
#import "RightViewController.h"
#import <MMDrawerVisualState.h>
@interface AppDelegate ()

@property (nonatomic,strong) MMDrawerController *drawController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    LeftViewController *leftVC =[[LeftViewController alloc]init];
    
    centerViewController *centerVC =[[centerViewController alloc]init];
    
    RightViewController *rightVC = [[RightViewController alloc]init];
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:centerVC];

    //创建侧拉菜单
    self.drawController = [[MMDrawerController alloc] initWithCenterViewController:nav leftDrawerViewController:leftVC rightDrawerViewController:rightVC];
    
    //打开抽屉的手势
    self.drawController.openDrawerGestureModeMask =MMOpenDrawerGestureModeAll;
    //关闭抽屉的手势
    self.drawController.closeDrawerGestureModeMask = MMCloseDrawerGestureModeAll;
    
    //设置抽屉阴影
    self.drawController.showsShadow = NO;
    
    //设置右侧抽屉宽度
    self.drawController.maximumRightDrawerWidth = 200;
    
    //设置侧拉抽屉效果
    [self.drawController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         MMDrawerControllerDrawerVisualStateBlock block;
         
         block = [MMDrawerVisualState slideVisualStateBlock];
         
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    
    //    self.drawerController.showsStatusBarBackgroundView = NO;
    
    self.window.rootViewController = self.drawController;
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
