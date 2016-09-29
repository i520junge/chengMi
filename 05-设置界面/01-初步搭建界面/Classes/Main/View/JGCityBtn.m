//
//  JGCityBtn.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/21.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGCityBtn.h"

@implementation JGCityBtn
-(void)awakeFromNib
{
    [super awakeFromNib] ;  //不要忘了
    self.layer.cornerRadius = 10 ;      //设置圆角
}
//将文字放左边，图片放右边
-(void)layoutSubviews
{
    [super layoutSubviews] ;
    //会来2次这个方法，布局按钮、布局按钮子控件
    self.titleLabel.x = self.width*0.5 - self.titleLabel.width ;
    self.imageView.x = self.width*0.5 + 10 ;
    
//    if (self.imageView.x > self.titleLabel.x) {
//        self.titleLabel.x = self.imageView.x ;
//        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame) + 10 ;
//    }
}

@end
