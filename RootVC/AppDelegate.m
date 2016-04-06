//
//  AppDelegate.m
//  RootVC
//
//  Created by 大麦 on 16/3/31.
//  Copyright © 2016年 lsp. All rights reserved.
//

#import "AppDelegate.h"
#import "AViewController.h"
#import "BViewController.h"
#import "CViewController.h"
#import "DViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    AViewController *vc_a = [[AViewController alloc]init];
    UINavigationController *nav_a = [[UINavigationController alloc]initWithRootViewController:vc_a];
    nav_a.tabBarItem.title = @"A";
    //
    BViewController *vc_b = [[BViewController alloc]init];
    UINavigationController *nav_b = [[UINavigationController alloc]initWithRootViewController:vc_b];
    nav_b.tabBarItem.title = @"B";
    //
    CViewController *vc_c = [[CViewController alloc]init];
    UINavigationController *nav_c = [[UINavigationController alloc]initWithRootViewController:vc_c];
    nav_c.tabBarItem.title = @"C";
    //
    DViewController *vc_d = [[DViewController alloc]init];
    UINavigationController *nav_d = [[UINavigationController alloc]initWithRootViewController:vc_d];
    nav_d.tabBarItem.title = @"D";
    //
    UITabBarController *tab = [[UITabBarController alloc]init];
    
    tab.viewControllers = @[nav_a,nav_b,nav_c,nav_d];
    self.window.rootViewController = tab;
    
    [self.window makeKeyAndVisible];

    
    return YES;
}

//+(void)goToCurrentVC:(NSString *)tagString withNav:(UINavigationController *)nav
//{
//    NSLog(@"count=%d",nav.viewControllers.count);
//    //判断nav里的数量
//    if([self isHaveNavigation:nav andTargetString:tagString])//当前的包涵这个类
//    {
//        int index =0;
//        if([nav.viewControllers count]!=0)
//        {
//            for(int i=0;i<[nav.viewControllers count];i++)
//            {
//                id object = [nav.viewControllers objectAtIndex:i];
//                if([object isKindOfClass:[NSClassFromString(tagString) class]])
//                {
//                    index = i;
//                    break;
//                }
//            }
//        }
//        [nav popToViewController:[nav.viewControllers objectAtIndex:index] animated:YES];
//    }
//    else
//    {
//        //获取其他的UINavigation//此处循环
//        //        [nav popToRootViewControllerAnimated:YES];
//        //        [self dismissViewControllerAnimated:YES completion:nil];
//        [[nav.viewControllers lastObject] dismissViewControllerAnimated:YES completion:nil];
//        //
////        UINavigationController *navc = ((UIViewController *)self.currentViewController).navigationController;
////        NSLog(@"vc=%d",navc.viewControllers.count);
//        
//        
//        
//        //判断当前类是否包含tagString
////        UINavigationController *navAA = (UINavigationController*)[self getPresentedViewController];
////        NSLog(@"vc=%d",navAA.viewControllers.count);
////        if([self isHaveNavigation:navAA andTargetString:tagString])//当前的包涵这个类
////        {
////            int index =0;
////            if([navAA.viewControllers count]!=0)
////            {
////                for(int i=0;i<[navAA.viewControllers count];i++)
////                {
////                    id object = [navAA.viewControllers objectAtIndex:i];
////                    if([object isKindOfClass:[NSClassFromString(tagString) class]])
////                    {
////                        index = i;
////                        break;
////                    }
////                }
////            }
////            [navAA popToViewController:[navAA.viewControllers objectAtIndex:index] animated:YES];
////        }
//    }
//    //获取当前页面的vc
////    UITabBarController *vc = (UITabBarController *)[[[AppDelegate theAppDelegate] window] rootViewController];
//     UITabBarController *vc = (UITabBarController *)[AppDelegate getCurrentVC];
//    NSLog(@"navc=%d",vc.viewControllers.count);
//    NSLog(@"%d",vc.viewControllers[0].navigationController.viewControllers.count);
//    NSLog(@"%d",vc.viewControllers[1].navigationController.viewControllers.count);
////    NSLog(@"vc=%d",vc.navigationController.viewControllers.count);
//}
//+ (UIViewController *)getPresentedViewController
//{
//    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
//    UIViewController *topVC = appRootVC;
//    if (topVC.presentedViewController) {
//        topVC = topVC.presentedViewController;
//    }
//    
//    return topVC;
//}
//+ (UIViewController *)getCurrentVC
//{
//    UIViewController *result = nil;
//    
//    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
//    if (window.windowLevel != UIWindowLevelNormal)
//    {
//        NSArray *windows = [[UIApplication sharedApplication] windows];
//        for(UIWindow * tmpWin in windows)
//        {
//            if (tmpWin.windowLevel == UIWindowLevelNormal)
//            {
//                window = tmpWin;
//                break;
//            }
//        }
//    }
//    
//    UIView *frontView = [[window subviews] objectAtIndex:0];
//    id nextResponder = [frontView nextResponder];
//    
//    if ([nextResponder isKindOfClass:[UIViewController class]])
//        result = nextResponder;
//    else
//        result = window.rootViewController;
//    
//    return result;
//}
//+(BOOL)isHaveNavigation:(UINavigationController *)nav andTargetString:(NSString *)tagString
//{
//    
//    if([nav.viewControllers count]!=0)
//    {
//        for(int i=0;i<[nav.viewControllers count];i++)
//        {
//            id object = [nav.viewControllers objectAtIndex:i];
//            if([object isKindOfClass:[NSClassFromString(tagString) class]])
//            {
//                return YES;
//            }
//        }
//    }
//    return NO;
//}
+ (AppDelegate *)theAppDelegate
{
    return (AppDelegate *)[UIApplication sharedApplication].delegate;
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
