//
//  JGTabBarController.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/19.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGTabBarController.h"
#import "JGNavigationController.h"

@interface JGTabBarController ()

@end

@implementation JGTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.hidden = YES ;
    
    NSArray *chiledVCNameArray = @[@"JGHomeVC",@"JGDiscoveryVC",@"JGMessageVC",@"JGSettingVC"] ;
    for (NSString *name in chiledVCNameArray) {
        UIViewController *vc = [[NSClassFromString(name) alloc] init] ;
        
        JGNavigationController *navC = [[JGNavigationController alloc] initWithRootViewController:vc] ;
       
        
        [self addChildViewController:navC] ;
}
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
