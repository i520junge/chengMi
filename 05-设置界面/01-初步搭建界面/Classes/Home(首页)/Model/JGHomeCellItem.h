//
//  JGHomeCellItem.h
//  01-初步搭建界面
//
//  Created by 刘军 on 16/9/21.
//  Copyright © 2016年 JunGe. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGHomeCellItem : NSObject
/**
 *  标题
 */
@property (nonatomic, copy) NSString *section_title;
/**
 *  图片地址
 */
@property (nonatomic, copy) NSString *imageURL;
/**
 *  浏览次数
 */
@property (nonatomic, copy) NSString *fav_count;
/**
 *  底部名称
 */
@property (nonatomic, copy) NSString *poi_name;

@end
