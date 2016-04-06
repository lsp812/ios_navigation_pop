//
//  GVC.m
//  RootVC
//
//  Created by 大麦 on 16/3/31.
//  Copyright © 2016年 lsp. All rights reserved.
//

#import "GVC.h"
#import "HVC.h"
@implementation GVC

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
    HVC *vc = [[HVC alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
//    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
//    [self presentViewController:nav animated:YES completion:nil];
}

@end
