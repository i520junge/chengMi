//
//  JGHomeDetailVCViewController.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/20.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGHomeDetailVCViewController.h"
#import "UIImage+JGImage.h"
#import "JGCoverView.h"
#import "JGShareView.h"

@interface JGHomeDetailVCViewController ()

@end

@implementation JGHomeDetailVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageRenderWithImageName:@"share" ] style:0 target:self action:@selector(shareClick)] ;
}
-(void)shareClick
{
    //弹出遮盖
    JGCoverView *coverV = [JGCoverView showCover] ;
    //弹出微信分享
    [JGShareView showShareView] ;
    
    coverV.block = ^(){
        [JGShareView hiddenShareView] ;
    } ;
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
