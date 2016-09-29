//
//  JGShareView.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/20.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGShareView.h"

@implementation JGShareView
+(void)showShareView
{
    JGShareView *shareV =  [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject] ;
    //控制其从下往上弹出
    shareV.width = screenW ;
    shareV.y = [UIScreen mainScreen].bounds.size.height;
    
    [[UIApplication sharedApplication].keyWindow addSubview:shareV] ;
    
    [UIView animateWithDuration:0.5 animations:^{
        shareV.y = [UIScreen mainScreen].bounds.size.height - shareV.height;
        
//        [[UIApplication sharedApplication].keyWindow addSubview:shareV] ;
     
    }] ;
}
+(void)hiddenShareView
{
    for (UIView *view in [UIApplication sharedApplication].keyWindow.subviews) {
        if ([view isKindOfClass:[JGShareView class]]) {
            [UIView animateWithDuration:0.5 animations:^{
                view.y = [UIScreen mainScreen].bounds.size.height;
                
                
            } completion:^(BOOL finished) {
                [view removeFromSuperview] ;
            }] ;
            
        }
        
        
    }
}
- (IBAction)cancelClick:(UIButton *)sender {
    [JGShareView hiddenShareView] ;
}

@end
