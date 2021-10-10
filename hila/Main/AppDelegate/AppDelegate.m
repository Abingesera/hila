//
//  AppDelegate.m
//  QHJ
//
//  Created by zsgjs on 2020/9/25.
//  Copyright © 2020 zsgjs. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()<LoadingDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    //创建全局网络监听管理者对象
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    //设置监听
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow];
                [[UIApplication sharedApplication].keyWindow addSubview:HUD];
                HUD.labelText = @"当前网络不可识别";
                HUD.mode = MBProgressHUDModeText;
                [HUD showAnimated:YES whileExecutingBlock:^{
                    sleep(1);
                } completionBlock:^{
                    [HUD removeFromSuperview];
                    
                }];
            }
                self.netType = @"unable";
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                MBProgressHUD *HUD = [[MBProgressHUD alloc] initWithView:[UIApplication sharedApplication].keyWindow];
                [[UIApplication sharedApplication].keyWindow addSubview:HUD];
                HUD.labelText = @"网络异常";
                HUD.mode = MBProgressHUDModeText;
                [HUD showAnimated:YES whileExecutingBlock:^{
                    sleep(1);
                } completionBlock:^{
                    [HUD removeFromSuperview];
                }];
            }
                self.netType = @"unable";
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN://2G,3G,4G...的网络
                
               
                
                self.netType = @"local";
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi://wifi的网络
                
                
                self.netType = @"wifi";
                break;
            default:
                break;
        }
    }];
    //开始监听
    [manager startMonitoring];
    
    
    
//    if (self.window == nil) {
        UIWindow *keyWindow = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        [keyWindow makeKeyAndVisible];
        self.window = keyWindow;
        LoadingController *vc = [[LoadingController alloc]init];
        vc.delegate = self;
        UINavigationController *loadingNav = [[UINavigationController alloc]initWithRootViewController:vc];
        self.window.rootViewController = loadingNav;
//    }
    
    return YES;
}


#pragma mark ZJLoadingDelegate Methods 切换页面
- (void)switchRootViewController {
    
//    TabBarController *tabBarVC = [[TabBarController alloc]init];
//    tabBarVC.delegate = self;
//    self.window.rootViewController = tabBarVC;
//    tabBarVC.selectedIndex = 0;
    
//    HomeModuleController *homeVC = [[HomeModuleController alloc]init];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:homeVC];
//    self.window.rootViewController = nav;
    
    
    TabBarController *tabBarVC = [[TabBarController alloc]init];
    self.window.rootViewController = tabBarVC;
    tabBarVC.selectedIndex = 0;
  
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    

    
}

@end
