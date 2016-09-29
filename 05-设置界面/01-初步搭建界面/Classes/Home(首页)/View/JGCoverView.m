//
//  JGCoverView.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/20.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGCoverView.h"

@implementation JGCoverView

+(instancetype)showCover
{
    JGCoverView *coverV = [[JGCoverView alloc] init] ;
    coverV.frame = [UIScreen mainScreen].bounds ;
    coverV.backgroundColor = [UIColor blackColor] ;
    coverV.alpha = 0.5 ;
    [[UIApplication sharedApplication].keyWindow addSubview:coverV] ;
    return coverV ;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    if (_block) {
        _block() ;
    }

    [self removeFromSuperview] ;
}

@end
