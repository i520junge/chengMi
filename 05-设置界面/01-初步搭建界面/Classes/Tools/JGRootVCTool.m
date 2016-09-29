//
//  JGRootVCTool.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/23.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGRootVCTool.h"
#import "JGMainViewController.h"
#import "JGFeatureVC.h"
#import "JGSaveTool.h"

#define JGVersion @"version"
@implementation JGRootVCTool
+(UIViewController *)chooseRootViewController
{
//    1、获取当前版本号
    NSString *curV = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"] ;
//    2、获取上一次版本号
    NSString *preV = [JGSaveTool objectForKey:JGVersion] ;
//    3、根据版本号判断，相同时进入主程序，不同时进去新特性
    if ([curV isEqualToString:preV]) {
        JGMainViewController *mainVC = [[JGMainViewController alloc] init] ;
        return mainVC ;
    }else{
        JGFeatureVC *featuer = [[JGFeatureVC alloc] init] ;
//        保存当前版本号
         [JGSaveTool setObject:curV forKey:JGVersion] ;
        return featuer ;
    }
    
}
@end
