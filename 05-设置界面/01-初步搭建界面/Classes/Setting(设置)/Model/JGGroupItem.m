//
//  JGGroupItem.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/24.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGGroupItem.h"

@implementation JGGroupItem

+(instancetype)groupItemWithRowArray:(NSArray *)rowArray
{
    JGGroupItem *groupItem = [[self alloc] init] ;
    groupItem.rowArray = rowArray ;
    return groupItem ;
}
@end
