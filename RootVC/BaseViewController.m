//
//  BaseViewController.m
//  RootVC
//
//  Created by 大麦 on 16/3/31.
//  Copyright © 2016年 lsp. All rights reserved.
//

#import "BaseViewController.h"
#import "AppDelegate.h"
#import "EVC.h"
#import "FVC.h"
#import "GVC.h"


@implementation BaseViewController

-(void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.navigationItem.title = [NSString stringWithUTF8String:object_getClassName(self)];
}

//只考虑了两级的
-(void)goToCurrentVC:(NSString *)tagString withNav:(UINavigationController *)nav
{
    
    if(![self isHaveNavigation:nav andTargetString:tagString])//一级不包含
    {
        [[nav.viewControllers lastObject] dismissViewControllerAnimated:YES completion:nil];
        UIViewController *vc = (UIViewController *)[self getCurrentVC];
        if([vc isKindOfClass:[UITabBarController class]])//最后一层了。是tab
        {
            UITabBarController *tab = (UITabBarController *)vc;
            UINavigationController *naTemp = [self getNavigationByTabbar:tab andTargetString:tagString];
            [self theFallBackWithNavigation:naTemp andTargetString:tagString];
        }
        else if ([vc isKindOfClass:[UINavigationController class]])
        {
            //此处会有多个循环(只考虑了两级)
            UINavigationController *naTemp = (UINavigationController *)vc;
            [self theFallBackWithNavigation:naTemp andTargetString:tagString];
        }
        else
        {
            //是UIviewContoller.(只考虑两级就应该是了)
            //此处也有多个循环(只来考虑了2级)
            if([vc isKindOfClass:[NSClassFromString(tagString) class]])
            {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
        }
    }
    else//包含的话(一级就包含)
    {
        [self theFallBackWithNavigation:nav andTargetString:tagString];
    }
}

-(UINavigationController *)getNavigationByTabbar:(UITabBarController *)tab andTargetString:(NSString *)tagString
{
    int index = 0;
    for(int i=0;i<tab.viewControllers.count;i++)
    {
         UINavigationController *navcTemp = (UINavigationController *)tab.viewControllers[i];
        if([self isHaveNavigation:navcTemp andTargetString:tagString])
        {
            index = i;
            break;
        }
    }
    UINavigationController *navcReturn = (UINavigationController *)tab.viewControllers[index];
    return navcReturn;

}
//-(void)goToCurrentVC:(NSString *)tagString withNav:(UINavigationController *)nav
//{
//    //判断nav里的数量
//    if([self isHaveNavigation:nav andTargetString:tagString])//当前的包涵这个类
//    {
//         [self theFallBackWithNavigation:nav andTargetString:tagString];
//    }
//    else
//    {
//        //获取其他的UINavigation//此处循环
//        [[nav.viewControllers lastObject] dismissViewControllerAnimated:YES completion:nil];
//    }
//    //获取当前页面的vc
//    UITabBarController *vc = (UITabBarController *)[self getCurrentVC];
//    UINavigationController *navc0 = (UINavigationController *)vc.viewControllers[0];
//    NSLog(@"vc=%@",vc);
//    NSLog(@"vc1=%@",vc.viewControllers[0]);
//    NSLog(@"navc=%d",navc0.viewControllers.count);
//    NSLog(@"navc=%@",navc0.viewControllers);
//    if([self isHaveNavigation:navc0 andTargetString:tagString])//当前的包涵这个类
//    {
//        [self theFallBackWithNavigation:navc0 andTargetString:tagString];
//    }
//}
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}
#pragma mark -- 判断在nav中是否包含tagString
-(BOOL)isHaveNavigation:(UINavigationController *)nav andTargetString:(NSString *)tagString
{
    BOOL flag = NO;
    if([nav.viewControllers count]!=0)
    {
        for(int i=0;i<[nav.viewControllers count];i++)
        {
            id object = [nav.viewControllers objectAtIndex:i];
            if([object isKindOfClass:[NSClassFromString(tagString) class]])
            {
                flag = YES;
                break;
            }
        }
    }
    return flag;
}
#pragma mark -- 在nav中包含tagString的话
-(void)theFallBackWithNavigation:(UINavigationController *)nav andTargetString:(NSString *)tagString
{
    int index =0;
    if([nav.viewControllers count]!=0)
    {
        for(int i=0;i<[nav.viewControllers count];i++)
        {
            id object = [nav.viewControllers objectAtIndex:i];
            if([object isKindOfClass:[NSClassFromString(tagString) class]])
            {
                index = i;
                break;
            }
        }
    }
    [nav popToViewController:[nav.viewControllers objectAtIndex:index] animated:YES];

}


@end
