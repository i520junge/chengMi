//
//  JGSaveTool.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/23.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGSaveTool : NSObject
/** 根据key值存储偏好设置 */
+(void)setObject:(id)value forKey:(NSString *)key ;

/** 根据key值读取偏好设置 */
+(id)objectForKey:(NSString *)defautName ;


@end
