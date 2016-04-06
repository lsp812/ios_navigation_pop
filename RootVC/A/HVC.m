//
//  HVC.m
//  RootVC
//
//  Created by 大麦 on 16/3/31.
//  Copyright © 2016年 lsp. All rights reserved.
//

#import "HVC.h"
#import "EVC.h"
@implementation HVC

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self create];
}

-(void)create
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setFrame:CGRectMake(100, 90, 120, 40)];
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)clickAction
{
//    UIViewController
    
//    A-E-F
//    G-H
    //此处考虑回退到E
    NSLog(@"%@",self.parentViewController);
    NSLog(@"%@",self.presentedViewController);
    NSLog(@"%@",self.presentingViewController);
    //
    UITabBarController *tab = (UITabBarController*)self.presentingViewController;
    NSLog(@"%@",tab.parentViewController);
    NSLog(@"%@",tab.presentedViewController);
    NSLog(@"%@",tab.presentingViewController);
    //
    UINavigationController *navAA = (UINavigationController *)tab.presentedViewController;
    //
    if([self isMovingFromParentViewController])
    {
        NSLog(@"AAA");
    }
    else
    {
        NSLog(@"BBB");
    }
    //
    NSLog(@"countQQ=%d",navAA.viewControllers.count);
    NSString *tagString = @"EVC";
    
    [self goToCurrentVC:tagString withNav:navAA];
//    [self goToCurrentVC:tagString withNav:navAA];
    
    
//    [self isMovingToParentViewController];
    
//    EVC *vc = [[EVC alloc]init];
    
//    [self showViewController:vc sender:nil];
//
//
//    NSLog(@"%@",self.parentViewController);
//    NSLog(@"%@",self.presentedViewController);
//
//    NSLog(@"%@",[UIApplication sharedApplication].keyWindow.gestureRecognizers);
    
//    [self didMoveToParentViewController:[[EVC alloc]init]];
//    NSString *backString = @"EVC";
//    [self.navigationController popToRootViewControllerAnimated:YES];
    
   

    //拿到EVC
//    [self rightCornerAction];
    
    
}
//-(void)rightCornerAction
//{
//    NSString *tagString = @"EVC";
//   [self goToCurrentVC:tagString withNav:self.navigationController];
//}


@end
