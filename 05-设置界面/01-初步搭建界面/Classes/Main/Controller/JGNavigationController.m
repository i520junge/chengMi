//
//  JGNavigationController.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/19.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGNavigationController.h"
#import "UIImage+JGImage.h"

@interface JGNavigationController ()

@end

@implementation JGNavigationController
+(void)load{
    
}
+(void)initialize{
    //ppearanceWhenContainedInInstancesOfClasses: 以后只要是这个类创建的 都用以下格式
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[JGNavigationController class]]] ;
    [bar setBackgroundImage:[UIImage imageNamed:@"navBg"] forBarMetrics:UIBarMetricsDefault] ;
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor],
                                  NSFontAttributeName:[UIFont systemFontOfSize:20]}] ;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //只有在各自控制器设置各自的leftBarButtonItem才有效果
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menuIcon"] style:0 target:self action:@selector(menuClick)] ;
    
}
//将控制器设置为根控制器时，就会调用push方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count == 0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageRenderWithImageName:@"menuIcon" ] style:0 target:self action:@selector(menuClick)] ;
        
    }else{
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageRenderWithImageName:@"NavBack" ] style:0 target:self action:@selector(back)] ;
        
    }
    [super pushViewController:viewController animated:animated] ;
}

-(void)menuClick{
    //跨级通知，用通知；上下级通知用代理或block
    [[NSNotificationCenter defaultCenter] postNotificationName:@"openMenu" object:nil] ;
}

-(void)back{
    [self popViewControllerAnimated:YES] ;
}
@end
