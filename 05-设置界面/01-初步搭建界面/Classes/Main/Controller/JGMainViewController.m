//
//  JGMainViewController.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/19.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGMainViewController.h"
#import "JGLeftView.h"
#import "JGTabBarController.h"

@interface JGMainViewController ()<JGLeftViewDelegate>
@property(nonatomic,strong)JGTabBarController *tabBC;
@end

@implementation JGMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addLeftView] ;
    [self addChiledViewControler] ;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(open) name:@"openMenu" object:nil] ;
}
/** 添加菜单view */
-(void)addLeftView
{
    JGLeftView *leftView = [JGLeftView leftView] ;
    leftView.frame = self.leftView.bounds ;
    leftView.delegate = self ;
    [self.leftView addSubview:leftView] ;
}
-(void)addChiledViewControler
{
    JGTabBarController *tabBC = [[JGTabBarController alloc] init] ;
    tabBC.view.frame = self.mainView.frame ;
    [self.mainView addSubview:tabBC.view] ;
//    [self addChildViewController:tabBC] ;
    //强引用TabBarController
    self.tabBC = tabBC ;
    
    //默认显示首页

}
//leftView的代理方法，实现换控制器
-(void)lefeView:(JGLeftView *)leftView preSelBtnIndex:(NSInteger)preSelBtnIndex toClickMenuBtnIndex:(NSInteger)btnIndex
{
    self.tabBC.selectedIndex = btnIndex ;
    [self close] ;
}
-(void)leftViewDidClickCityToCloseDrag:(JGLeftView *)leftView
{
    [self close] ;
}
@end
