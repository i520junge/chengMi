//
//  JGRowItem.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/24.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGRowItem.h"

@implementation JGRowItem

+(instancetype)rowItemWithIconImage:(UIImage *)iconImage title:(NSString *)title subTitle:(NSString *)subTitle
{
    JGRowItem *rowItem = [[self alloc] init] ;
    rowItem.iconImage = iconImage ;
    rowItem.title = title ;
    rowItem.subTitle = subTitle ;
    return rowItem ;
}

@end
