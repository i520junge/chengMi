//
//  JGHomeSectionItem.m
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/21.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import "JGHomeSectionItem.h"
#import "MJExtension.h"

@implementation JGHomeSectionItem
+ (NSDictionary *)mj_objectClassInArray
{
    
    return @{
             @"body":@"JGHomeCellItem"
             } ;
}

+(NSArray *)getHomeSectionItemList
{
     return [JGHomeSectionItem mj_objectArrayWithFilename:@"HomeDatas.plist"] ;
}
@end
