//
//  UIView+JGFrame.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/21.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JGFrame)
//一般分类不能添加属性
//分类用property添加属性只会申明setter和getter方法，不会实现它，所以需要实现setter/getter方法
//分类用property不会自动生成下划线属性
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat height;
@property(nonatomic,assign)CGFloat x;
@property(nonatomic,assign)CGFloat y;
@end
