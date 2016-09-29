//
//  JGDiscoveryItem.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/22.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGDiscoveryItem.h"
#import "MJExtension.h"

@implementation JGDiscoveryItem

+(NSDictionary *)mj_objectClassInArray
{
    return @{
             @"themes":@"JGCellItem"
             } ;
}
+(NSArray *)getDiscoveryList{
    return [JGDiscoveryItem mj_objectArrayWithFilename:@"message.plist"] ;
}
@end
