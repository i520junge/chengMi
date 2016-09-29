//
//  JGSaveTool.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/23.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGSaveTool.h"

@implementation JGSaveTool
/** 根据key值存储偏好设置 */
+(void)setObject:(id)value forKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key] ;
}

/** 根据key值读取偏好设置 */
+(id)objectForKey:(NSString *)defautName
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:defautName] ;
}

@end
