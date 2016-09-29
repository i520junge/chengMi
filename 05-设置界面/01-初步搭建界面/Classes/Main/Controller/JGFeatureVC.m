//
//  JGFeatureVC.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/23.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGFeatureVC.h"
#import "JGMainViewController.h"

@interface JGFeatureVC ()

@end

@implementation JGFeatureVC
//初始化view为一张图片
-(void)loadView
{
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide"]] ;
    imageV.frame = [UIScreen mainScreen].bounds;
    imageV.userInteractionEnabled = YES ;
    self.view = imageV ;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    添加按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom] ;
    [btn setBackgroundImage:[UIImage imageNamed:@"startIcon"] forState:UIControlStateNormal] ;
    btn.center = CGPointMake(screenW*0.5, screenH*0.8) ;
    btn.bounds = CGRectMake(0, 0, 200, 50) ;
    
//    btn.width = 200;
//    btn.height = 50 ;
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside] ;
    [self.view addSubview:btn] ;
    
}
//点击进入主程序
-(void)btnClick{
    JGMainViewController *mainVC = [[JGMainViewController alloc] init] ;
    [UIApplication sharedApplication].keyWindow.rootViewController = mainVC ;
}

@end
