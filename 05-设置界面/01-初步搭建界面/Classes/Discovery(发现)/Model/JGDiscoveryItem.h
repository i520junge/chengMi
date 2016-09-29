//
//  JGDiscoveryItem.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/22.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <Foundation/Foundation.h>
@class JGHeaderItem ;
@interface JGDiscoveryItem : NSObject
//头部
@property (nonatomic, strong) JGHeaderItem *header;

@property (nonatomic, strong) NSMutableArray *themes;

+ (NSArray *)getDiscoveryList;

@end
