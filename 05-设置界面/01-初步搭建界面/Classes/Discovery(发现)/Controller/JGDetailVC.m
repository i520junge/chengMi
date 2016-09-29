//
//  JGDetailVC.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/28.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGDetailVC.h"

@interface JGDetailVC ()


@end

@implementation JGDetailVC
//-(void)setImageView:(UIImageView *)imageView
//{
//    _imageView = imageView ;
//    
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(cellClick:) name:@"cellClick" object:nil] ;
}
-(void)cellClick:(UIImage *)image{
    self.imageView.image = image ;
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
